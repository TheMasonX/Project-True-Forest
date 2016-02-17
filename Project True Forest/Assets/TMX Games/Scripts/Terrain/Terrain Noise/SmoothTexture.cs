using UnityEngine;
using System.Collections;
using TMX.Utils;

[System.Serializable]
public class SmoothTexture
{
	[Range(0,6)]
	public int filterRadius;
	public Curve smoothingCurve;

	public Color[,] SmoothColorGrid (Color[,] colorGrid)
	{
		float lastTime = Time.realtimeSinceStartup;
		int filterSize = filterRadius * 2 + 1;
		int width = colorGrid.GetLength(0);
		int height = colorGrid.GetLength(1);

		Color[,] newColorGrid = new Color[width, height];

		SmoothColorFilterGrid filterGrid = new SmoothColorFilterGrid (filterSize, width, height, smoothingCurve);

		for (int x = 0; x < width; x++)
		{
			for (int y = 0; y < height; y++)
			{
				filterGrid.ApplySmoothing(ref newColorGrid, x, y, colorGrid[x,y]);
			}
		}

		int gridPoints = (width * height);
		int samplePoints = gridPoints * filterSize * filterSize;
		Debug.Log("Smoothing " + gridPoints.ToString("E2") + " points (" + samplePoints.ToString("E2") + " samples) took " + (Time.realtimeSinceStartup - lastTime).ToString("E2") + " seconds");
		return newColorGrid;
	}
}

public class SmoothColorFilterGrid
{
	int filterSize;
	float[,] filterGrid;
	int totalWidth;
	int totalHeight;

	int center;
	Vector2Int centerPoint;
	float maxSampleDistance;

	//store here to cut down on garbage
	Vector2 samplePoint;
	int sampleX;
	int sampleY;

	public SmoothColorFilterGrid (int _filterSize, int _totalWidth, int _totalHeight, Curve _smoothingCurve)
	{
		filterSize = _filterSize;
		totalWidth = _totalWidth;
		totalHeight = _totalHeight;
		filterGrid = new float[filterSize, filterSize];
		center = (filterSize - 1) / 2;
		centerPoint = new Vector2Int (center, center);

		maxSampleDistance = (float)center * CustomMathf.sqrt2;
		samplePoint = new Vector2 (0,0);
		float sampleDistance = 0f;
		float sampleModifier = 0f;
		for (int x = 0; x < filterSize; x++)
		{
			for (int y = 0; y < filterSize; y++)
			{
				samplePoint.x = x;
				samplePoint.y = y;

				sampleDistance = 1f - ((samplePoint - centerPoint).magnitude / maxSampleDistance);

				filterGrid[x, y] = _smoothingCurve.GetValue(sampleDistance);
				sampleModifier += filterGrid[x, y];
			}
		}

		//normalize the filter amount
		sampleModifier = 1f / sampleModifier;
		for (int x = 0; x < filterSize; x++)
		{
			for (int y = 0; y < filterSize; y++)
			{
				filterGrid[x, y] *= sampleModifier;
			}
		}
	}

	public void ApplySmoothing (ref Color[,] colorGrid, int centerX, int centerY, Color centerValue)
	{
		for (int x = 0; x < filterSize; x++)
		{
			for (int y = 0; y < filterSize; y++)
			{
				sampleX = centerX + (x - centerPoint.x);
				sampleY = centerY + (y - centerPoint.y);
				if (sampleX < 0 || sampleX >= totalWidth || sampleY < 0 || sampleY >= totalHeight)
				{
					colorGrid[centerX,centerY] += filterGrid[x, y] * centerValue;
					continue;
				}
				colorGrid[sampleX, sampleY] += filterGrid[x, y] * centerValue;
			}
		}
	}
}