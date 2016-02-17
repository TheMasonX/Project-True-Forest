using UnityEngine;
using System.Collections;
using TMX.Utils;
using System.Collections.Generic;

[System.Serializable]
public class FlowMapGenerator
{
	public int textureSize = 512;
	public int samplesPerPixel = 3;
	public Curve flowColorBySlope;
	public Texture2D flowMap;
	public SmoothTexture smoothTexturePass;

	private Vector3 mapSize;
	private LayerMask terrainLayerMask;
	private SlopeInfo[,] hitGrid;

	public void GenerateFlowMap ()
	{
		flowMap = new Texture2D (textureSize, textureSize);
		flowMap.name = "Generated Flow Map";
		Color[] flowMapColors = new Color[textureSize * textureSize];

		var forestController = ForestController.Instance;
		if (!forestController)
		{
			forestController = GameObject.FindObjectOfType<ForestController>();
		}
		mapSize = forestController.mapSize;
		terrainLayerMask = forestController.terrainLayerMask;

		float sampleRadius = (mapSize.x + mapSize.z) / 2f / (float)textureSize;
//		Debug.Log("Sample Radius: " + sampleRadius);

		Vector3 centerOffset = new Vector3 (-mapSize.x / 2f, 0f, -mapSize.z / 2f);

		int totalSamples = 0;
		Vector3 samplePoint;
		RaycastHit hit;
		hitGrid = new SlopeInfo[textureSize,textureSize];
		for (int x = 0; x < textureSize; x++)
		{
			for (int y = 0; y < textureSize; y++)
			{
				samplePoint = new Vector3 ((float)x / (float)(textureSize - 1) * mapSize.x, mapSize.y, (float)y / (float)(textureSize - 1) * mapSize.z) + centerOffset;
				for (int i = 0; i <= samplesPerPixel; i++)
				{
					Color debugRayColor = Color.blue;
					hitGrid[x, y] = new SlopeInfo ();
					Vector3 offset = Vector3.zero;
					if (i > 0)
					{
						float theta = (float)i / (float)samplesPerPixel * Mathf.PI * 2f;
						offset = new Vector3 (Mathf.Cos(theta), 0f, Mathf.Sin(theta)) * sampleRadius;
						debugRayColor = Color.red;
					}
					if (Physics.Raycast(samplePoint + offset, Vector3.down, out hit, mapSize.y * 1.5f, terrainLayerMask))
					{
						if (x % 64 == 0 && y % 64 == 0)
						{
							Debug.DrawLine(samplePoint + offset, hit.point, debugRayColor, 10f);
						}

						hitGrid[x, y].AddData(hit.point, hit.normal);
						totalSamples++;
					}
				}
				hitGrid[x, y].GetStats(x % 64 == 0 && y % 64 == 0);
			}
		}

		Debug.Log("Total Samples: " + totalSamples);

		if (smoothTexturePass.filterRadius > 0)
		{
			Color[,] smoothableGrid = new Color[textureSize, textureSize];
			for (int x = 0; x < textureSize; x++)
			{
				for (int y = 0; y < textureSize; y++)
				{
					smoothableGrid[x, y] = GetFlowColorAtPoint(x, y);
				}
			}

			smoothableGrid = smoothTexturePass.SmoothColorGrid(smoothableGrid);

			for (int x = 0; x < textureSize; x++)
			{
				for (int y = 0; y < textureSize; y++)
				{
					int pixelIndex = y * textureSize + x;
					flowMapColors[pixelIndex] = smoothableGrid[x, y];
				}
			}
		}
		else
		{
			for (int x = 0; x < textureSize; x++)
			{
				for (int y = 0; y < textureSize; y++)
				{
					int pixelIndex = y * textureSize + x;
					flowMapColors[pixelIndex] = GetFlowColorAtPoint(x, y);
				}
			}
		}
		flowMap.SetPixels(flowMapColors);
		flowMap.Apply();
	}

	public Color GetFlowColorAtPoint (int centerX, int centerY)
	{
		Color flowColor = new Color (0f, 0f, 0f, 0f);
		Vector3 lowestPoint = hitGrid[centerX, centerY].averagePoint;
		bool lowerPoint = false;

		for (int x = -1; x <= 1; x++)
		{
			for (int y = -1; y <= 1; y++)
			{
				int sampleX = centerX + x;
				int sampleY = centerY + y;

				//TODO: possibly do something smarter than ignoring out of bounds points
				if (sampleX < 0 || sampleX >= textureSize || sampleY < 0 || sampleY >= textureSize)
				{
					continue;
				}
				if (sampleX == centerX && sampleY == centerY)
				{
					continue;
				}
				var sampleHitPoint = hitGrid[sampleX, sampleY].lowestPoint;
				if (sampleHitPoint.y < lowestPoint.y)
				{
					lowestPoint = sampleHitPoint;
					lowerPoint = true;
				}
			}
		}
		if (lowerPoint)
		{
			Vector3 offset = lowestPoint - hitGrid[centerX, centerY].averagePoint;
			Vector3 xOffset = offset;
			Vector3 zOffset = offset;
			xOffset.z = 0f;
			zOffset.x = 0f;

			float xSlope = Mathf.Sign(xOffset.x) * flowColorBySlope.GetValue(Vector3.Dot(Vector3.up, xOffset.normalized)) + .5f;
			float zSlope = Mathf.Sign(zOffset.z) * flowColorBySlope.GetValue(Vector3.Dot(Vector3.up, zOffset.normalized)) + .5f;
			flowColor = new Color (xSlope, zSlope, 0f, 0f);
		}
		else
		{
//			Debug.Log("No Lower Points");
			flowColor = new Color (.5f, .5f, 1f, 0f);
		}

		return flowColor;
	}
}

public class SlopeInfo
{
	public List<Vector3> hitPoints;
	public List<Vector3> normals;
	public Vector3 lowestPoint;
	public Vector3 averagePoint;
	public Vector3 highestPoint;

	public SlopeInfo ()
	{
		this.hitPoints = new List<Vector3> ();
		this.normals = new List<Vector3> ();
	}

	public void AddData (Vector3 newHitpoint, Vector3 newNormal)
	{
		this.hitPoints.Add(newHitpoint);
		this.normals.Add(newNormal);
	}

	public void GetStats (bool debug = false)
	{
		lowestPoint = Vector3.up * 100000f;
		highestPoint = Vector3.down * 10000f;
		averagePoint = Vector3.zero;
		for (int i = 0; i < hitPoints.Count; i++)
		{
			averagePoint += hitPoints[i];
			if (hitPoints[i].y < lowestPoint.y)
			{
				lowestPoint = hitPoints[i];
			}
			if (hitPoints[i].y > highestPoint.y)
			{
				highestPoint = hitPoints[i];
			}
		}
		averagePoint /= hitPoints.Count;
//		if(debug) Debug.Log("Lowest Point: " + CustomToString.V3(lowestPoint) + " | Highest Point: " + CustomToString.V3(highestPoint) + " | Average Point: " + CustomToString.V3(averagePoint));
	}
}