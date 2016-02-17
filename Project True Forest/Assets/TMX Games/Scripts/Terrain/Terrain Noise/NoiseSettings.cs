using UnityEngine;
using System.Collections;
using LibNoise.Unity.Generator;
using TMX.Utils;
using LibNoise.Unity.Operator;
using LibNoise.Unity;

[CreateAssetMenu()]
[System.Serializable]
public class NoiseSettings : ScriptableObject
{
	public string passName = "Pass";

	public enum NoiseType
	{
		PERLIN = 0,
		BILLOW = 1,
		RIGGED_MULTIFRACTAL = 2
	}

	public NoiseType noisePassType;

	public enum PassOperation
	{
		ADD = 0,
		MULTIPLY = 1
	}

	public PassOperation passOperationType;

	public double frequency = .5;
	public double lacunarity = 2;
	public double persistence = .5;
	public int octaves = 3;
	public LibNoise.Unity.QualityMode quality;

	public TMX.Utils.Curve outputCurve;

	public TurbulenceSettings turbulenceSettings;

	private GenericNoisePass typedAndInstantiatedPass;
	[HideInInspector] public float[,] debugPreviewGrid;

	public void ModifyGrid (ref float[,] grid, float height, int seed)
	{
		InstantiatePassType(seed);

		float gridWidth = grid.GetLength(0);
		float gridHeight = grid.GetLength(1);
		for (int x = 0; x < gridWidth; x++)
		{
			for (int y = 0; y < gridHeight; y++)
			{
				float xPercent = (float)x / gridWidth;
				float yPercent = (float)y / gridHeight;
				if (passOperationType == PassOperation.ADD)
				{
					grid[x, y] += GetNoiseValue(xPercent, yPercent, height);
				}
				else if (passOperationType == PassOperation.MULTIPLY)
				{
					grid[x, y] *= GetNoiseValue(xPercent, yPercent, 1f);
				}
			}
		}
	}

	public float GetNoiseValue (float xPercent, float yPercent, float height)
	{
		return typedAndInstantiatedPass.GetNoiseValue(xPercent, yPercent, height);
	}

	public void InstantiatePassType (int seed)
	{
		switch (noisePassType)
		{
		case NoiseType.PERLIN:
			typedAndInstantiatedPass = new PerlinPass ();
			break;
		case NoiseType.BILLOW:
			typedAndInstantiatedPass = new BillowPass ();
			break;
		case NoiseType.RIGGED_MULTIFRACTAL:
			typedAndInstantiatedPass = new RiggedMultifractalPass ();
			break;
		}

		typedAndInstantiatedPass.Initialize(this, seed);

		if (turbulenceSettings.isActive)
		{
			turbulenceSettings.Initialize(seed, typedAndInstantiatedPass.noiseModule);
			typedAndInstantiatedPass.noiseModule = turbulenceSettings.turbulenceModule;
		}
	}

	public void RandomizeValues ()
	{
		frequency = (double)Random.Range(.25f, 1f);
		lacunarity = (double)Random.Range(1.75f, 2.25f);
		persistence = (double)Random.Range(.4f, .6f);
		octaves = Random.Range(1, 5);
	}
}

public class GenericNoisePass
{
	public NoiseSettings noiseSettings;
	public ModuleBase noiseModule;
	public int seed;

	public void Initialize (NoiseSettings newNoiseSettings, int newSeed)
	{
		noiseSettings = newNoiseSettings;
		seed = newSeed;
		GenerateNoise();
	}

	public virtual void GenerateNoise ()
	{

	}

	public float GetNoiseValue (float xPercent, float yPercent, float height)
	{
		float value = ((float)noiseModule.GetValue(new Vector3 (xPercent - .359234f, -2.21347f, yPercent + .281231f) * Mathf.PI));
		return noiseSettings.outputCurve.GetValue(value) * height;
	}
}

public class BillowPass : GenericNoisePass
{
	public override void GenerateNoise ()
	{
		noiseModule = new Billow (noiseSettings.frequency, noiseSettings.lacunarity, noiseSettings.persistence, noiseSettings.octaves, seed, noiseSettings.quality);
	}
}

public class PerlinPass : GenericNoisePass
{
	public override void GenerateNoise ()
	{
		noiseModule = new Perlin (noiseSettings.frequency, noiseSettings.lacunarity, noiseSettings.persistence, noiseSettings.octaves, seed, noiseSettings.quality);
	}
}

public class RiggedMultifractalPass : GenericNoisePass
{
	public override void GenerateNoise ()
	{
		noiseModule = new RiggedMultifractal (noiseSettings.frequency, noiseSettings.lacunarity, noiseSettings.octaves, seed, noiseSettings.quality);
	}
}

[System.Serializable]
public class TurbulenceSettings
{
	public bool isActive;
	public Turbulence turbulenceModule;
	public double frequency;
	public double power;
	public int roughness;

	public void Initialize (int seed, ModuleBase inputModule)
	{
		turbulenceModule = new Turbulence (power, inputModule);
		turbulenceModule.Frequency = frequency;
		turbulenceModule.Roughness = roughness;
		turbulenceModule.Seed = seed;
	}

	public double ApplyTurbulence (double x, double y, double z)
	{
		return turbulenceModule.GetValue(x, y, z);
	}
}

[System.Serializable]
public struct PassSettingsAndActive
{
	public bool isActive;
	[SerializeField] public NoiseSettings noiseSettings;

	public PassSettingsAndActive(bool _isActive, NoiseSettings _noiseSettings)
	{
		isActive = _isActive;
		noiseSettings = _noiseSettings;
	}
}