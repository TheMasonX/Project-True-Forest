using UnityEngine;
using System.Collections;
using TMX.Utils;

[System.Serializable]
public class ProceduralTerrainSettings
{
	public int seed;
	public bool useSeed;
	public int heightmapResolution;
	public float roughness;
	public AnimationCurve initialHeightCurve;
	public float[,] heightmap;

	public FlattenPeaks[] flattenPeaksPasses;
	public SmoothArray[] smoothingPasses;

	private Vector3 mapSize;

	public void GetNoise (Vector3 newMapSize)
	{
		mapSize = newMapSize;

		if (!useSeed)
		{
			seed = CustomMathf.GetRandomSeed();
		}

		heightmap = new float[heightmapResolution,heightmapResolution];
		heightmap = DiamondSquare.DiamondSquareGrid(heightmapResolution, seed, 5f, mapSize.y, roughness, initialHeightCurve);

		for (int i = 0; i < flattenPeaksPasses.Length; i++)
		{
			if (flattenPeaksPasses[i].filterRadius > 0)
			{
				heightmap = flattenPeaksPasses[i].Flatten(heightmap, mapSize.x / (float)heightmapResolution, mapSize.z / (float)heightmapResolution);
			}
		}

		for (int i = 0; i < smoothingPasses.Length; i++)
		{
			if (smoothingPasses[i].filterRadius > 0)
			{
				heightmap = smoothingPasses[i].SmoothGrid(heightmap);
			}
		}
	}


	#region Interpolation
	private enum FloatToIntMethod
	{
		ROUND = 0,
		FLOOR = 1,
		CEIL = 2,
		NONE = 3
	}

	public float InterpolateValue (Vector2 uvPosition)
	{
		if (mapSize.x > mapSize.z)
		{
			uvPosition.y *= mapSize.z / mapSize.x;
		}
		else if (mapSize.x < mapSize.z)
		{
			uvPosition.x *= mapSize.x / mapSize.z;
		}

		uvPosition *= .99f + .005f; //add just a bit of cushion
		Vector2 floatPixelPoint = GetPixelFromUV(uvPosition, FloatToIntMethod.NONE);

		Vector2Int topLeftPixelPoint = Vector2Int.ToInt(GetPixelFromUV(uvPosition, FloatToIntMethod.FLOOR));
		Vector2Int bottomRightPixelPoint = Vector2Int.ToInt(GetPixelFromUV(uvPosition, FloatToIntMethod.CEIL));

		Vector2Int topRightPixelPoint = new Vector2Int (bottomRightPixelPoint.x, topLeftPixelPoint.y);
		Vector2Int bottomLeftPixelPoint = new Vector2Int (topLeftPixelPoint.x, bottomRightPixelPoint.y);

		Vector2 interpolationPercents = floatPixelPoint - topLeftPixelPoint;

		Vector4 interpolatedValues = new Vector4 ((1f - interpolationPercents.x) * (1f - interpolationPercents.y),
			(interpolationPercents.x) * (1f - interpolationPercents.y),
			(1f - interpolationPercents.x) * (interpolationPercents.y),
			(interpolationPercents.x) * (interpolationPercents.y));

		float output = SampleArray(topLeftPixelPoint) * interpolatedValues.x;
		output += SampleArray(topRightPixelPoint) * interpolatedValues.y;

		output += SampleArray(bottomLeftPixelPoint) * interpolatedValues.z;
		output += SampleArray(bottomRightPixelPoint) * interpolatedValues.w;

		return output;
	}

	private float SampleArray (Vector2Int point)
	{
		return heightmap[point.x, point.y];
	}

	private Vector2 GetPixelFromUV (Vector2 uv, FloatToIntMethod method)
	{
		Vector2 output = Vector2.zero;
		float x = uv.x * (float)(heightmapResolution - 1f);
		float y = uv.y * (float)(heightmapResolution - 1f);
		if (method == FloatToIntMethod.ROUND)
		{
			output.x = Mathf.Round(x);
			output.y = Mathf.Round(y);
		}
		else if (method == FloatToIntMethod.FLOOR)
		{
			output.x = Mathf.Floor(x);
			output.y = Mathf.Floor(y);
		}
		else if (method == FloatToIntMethod.CEIL)
		{
			output.x = Mathf.Ceil(x);
			output.y = Mathf.Ceil(y);
		}
		else if (method == FloatToIntMethod.NONE)
		{
			output.x = x;
			output.y = y;
		}
		else
		{
			Debug.LogError("Invalid Float To Int Method");
		}
		return output;
	}
	#endregion
}
