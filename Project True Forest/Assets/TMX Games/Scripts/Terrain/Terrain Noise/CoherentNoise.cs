using UnityEngine;
using System.Collections;
using LibNoise.Unity.Generator;
using TMX.Utils;

[System.Serializable]
public class CoherentNoise
{
	public BillowSettings[] billowPasses;
	public PerlinSettings[] perlinPasses;
	public RiggedMulti[] riggedMultifractalPasses;

	public virtual void Generate (ref float[,] grid, float height, int seed)
	{
		for (int i = 0; i < billowPasses.Length; i++)
		{
			billowPasses[i].Generate(ref grid, height, seed);
		}

		for (int i = 0; i < perlinPasses.Length; i++)
		{
			perlinPasses[i].Generate(ref grid, height, seed);
		}

		for (int i = 0; i < riggedMultifractalPasses.Length; i++)
		{
			riggedMultifractalPasses[i].Generate(ref grid, height, seed);
		}
	}
}

[System.Serializable]
public class NoiseSettings
{
	public string passName = "Pass";

	public bool active;

	public double frequency = .5;
	public double lacunarity = 2;
	public double persistence = .5;
	public int octaves = 3;
	public LibNoise.Unity.QualityMode quality;

	public Curve outputCurve;

	public void RandomizeValues ()
	{
		frequency = (double)Random.Range(.25f, 1f);
		lacunarity = (double)Random.Range(1.75f, 2.25f);
		persistence = (double)Random.Range(.4f, .6f);
		octaves = Random.Range(1, 5);
	}

	public virtual void Generate (ref float[,] grid, float height, int seed)
	{
		if (!active)
			return;
		
		float gridWidth = grid.GetLength(0);
		float gridHeight = grid.GetLength(1);
		for (int x = 0; x < gridWidth; x++)
		{
			for (int y = 0; y < gridHeight; y++)
			{
				float xPercent = (float)x / gridWidth;
				float yPercent = (float)y / gridHeight;
				grid[x, y] += GetNoiseValue(xPercent, yPercent, height);
			}
		}
	}

	public virtual float GetNoiseValue (float xPercent, float yPercent, float height)
	{
		return 0f;
	}

}

[System.Serializable]
public class BillowSettings : NoiseSettings
{
	private Billow billow;
	public override void Generate (ref float[,] grid, float height, int seed)
	{
		billow = new Billow (frequency, lacunarity, persistence, octaves, seed, quality);
		base.Generate(ref grid, height, seed);
	}

	public override float GetNoiseValue (float xPercent, float yPercent, float height)
	{
		float value = ((float)billow.GetValue(new Vector3 (xPercent - .159234f, -2.21347f, yPercent + .281231f) * Mathf.PI));
		return outputCurve.GetValue(value) * height;
	}
}


[System.Serializable]
public class PerlinSettings : NoiseSettings
{

	private Perlin perlin;
	public override void Generate (ref float[,] grid, float height, int seed)
	{
		perlin = new Perlin (frequency, lacunarity, persistence, octaves, seed, quality);
		base.Generate(ref grid, height, seed);
	}

	public override float GetNoiseValue (float xPercent, float yPercent, float height)
	{
		float value = ((float)perlin.GetValue(new Vector3 (xPercent - .790697f, 12.06557377f, yPercent + 7.78134782f) * Mathf.PI));
		return outputCurve.GetValue(value) * height;
	}
}

[System.Serializable]
public class RiggedMulti : NoiseSettings
{
	private RiggedMultifractal rigged;
	public override void Generate (ref float[,] grid, float height, int seed)
	{
		rigged = new RiggedMultifractal (frequency, lacunarity, octaves, seed, quality);
		base.Generate(ref grid, height, seed);
	}

	public override float GetNoiseValue (float xPercent, float yPercent, float height)
	{
		float value = ((float)rigged.GetValue(new Vector3 (xPercent + 9.792607f, 55.2067737f, yPercent - 81.3782747f) * Mathf.PI));
		return outputCurve.GetValue(value) * height;
	}
}