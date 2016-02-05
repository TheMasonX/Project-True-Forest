using UnityEngine;
using System.Collections;
using TMX.Utils;

[System.Serializable]
public class FlattenPeaks
{
	[Range(0,3)]
	public int filterRadius = 2;
	public Curve smoothingFromSlope;

	public Curve neighborSmoothing;

	int filterSize;
	float gridScaleX;
	float gridScaleY;
	int width;
	int height;
	int center;
	Vector2Int centerPoint;
	int sampleX;
	int sampleY;
	float sampleSlope;
	Vector3 sampleCenter;
	Vector3 sampleSurroundingPoint;
	int currentSamples;
	float calcSmoothing;
	float localAverage;
	int localAverageSamples;
	float neighborDistance;
	float maxNeighborDistance;

	public float[,] Flatten (float[,] grid, float _gridScaleX, float _gridScaleY)
	{
		float lastTime = Time.realtimeSinceStartup;

		gridScaleX = _gridScaleX;
		gridScaleY = _gridScaleY;
		filterSize = filterRadius * 2 + 1;
		width = grid.GetLength(0);
		height = grid.GetLength(1);

		center = (filterSize - 1) / 2;
		centerPoint = new Vector2Int (center, center);
		maxNeighborDistance = (float)center * CustomMathf.sqrt2;

		for (int x = 0; x < width; x++)
		{
			for (int y = 0; y < height; y++)
			{
				SamplePoint(ref grid, x, y);
			}
		}
		int gridPoints = (width * height);
		int samplePoints = gridPoints * filterSize * filterSize;
//		Debug.Log("Flattening " + gridPoints.ToString("E2") + " points (" + samplePoints.ToString("E2") + " samples) took " + (Time.realtimeSinceStartup - lastTime).ToString("E2") + " seconds");
		return grid;
	}


	public void SamplePoint (ref float[,] grid, int centerX, int centerY)
	{
		currentSamples = 0;
		sampleSlope = 0f;
		localAverage = 0f;
		sampleCenter.x = centerX * gridScaleX;
		sampleCenter.y = grid[centerX, centerY];
		sampleCenter.z = centerY * gridScaleY;

		for (int x = 0; x < filterSize; x++)
		{
			for (int y = 0; y < filterSize; y++)
			{
				sampleX = centerX + (x - centerPoint.x);
				sampleY = centerY + (y - centerPoint.y);
				if (sampleX < 0 || sampleX >= width || sampleY < 0 || sampleY >= height || (x == centerPoint.x && y == centerPoint.y))
					continue;

				sampleSurroundingPoint.x = sampleX * gridScaleX;
				sampleSurroundingPoint.y = grid[sampleX, sampleY];
				sampleSurroundingPoint.z = sampleY * gridScaleY;

				sampleSlope += Vector3.Dot((sampleCenter - sampleSurroundingPoint).normalized, Vector3.up);
				localAverage += sampleSurroundingPoint.y;

				currentSamples++;
			}

		}

		float originalSlope = sampleSlope;
		sampleSlope /= (float)currentSamples;

		calcSmoothing = smoothingFromSlope.GetValue(sampleSlope);
		if (Mathf.Abs(calcSmoothing) > 0.01f)
		{
			localAverage /= (float)currentSamples;

			for (int x = 0; x < filterSize; x++)
			{
				for (int y = 0; y < filterSize; y++)
				{
					sampleX = centerX + (x - centerPoint.x);
					sampleY = centerY + (y - centerPoint.y);
					if (sampleX < 0 || sampleX >= width || sampleY < 0 || sampleY >= height || (x == 0 && y == 0))
						continue;

					neighborDistance = (new Vector2(x,y) - centerPoint).magnitude / maxNeighborDistance;
					grid[sampleX, sampleY] = Mathf.Lerp(grid[sampleX, sampleY], localAverage, calcSmoothing * neighborSmoothing.GetValue(neighborDistance));
				}
			}
		}
	}
}
