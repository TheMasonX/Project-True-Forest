using System.Collections;
using System.Collections.Generic;
using TMX.Utils;
using UnityEngine;

public class ForestController : MonoBehaviour
{
	public static ForestController Instance;

	public Vector3 mapSize;

	public float yearLength = 120f;
	public float ageUpdateInterval = 10f;
	public float scaleUpdateInterval = 0.25f;
	public float scoreUpdateInterval = 10f;


	public bool reproduceAnnually = true;
	public int reproductionAttemptsPerFrame = 200;

	[HideInInspector] public float maxTerrainHeight;
	public TerrainObjectType[] foliageTypes;
	private Transform[] terrainObjectContainers;
	private List<FoliageObject> foliageObjects;
	private List<TerrainObject> terrainObjects;
	public LayerMask terrainLayerMask;
	public LayerMask objectLayerMask;
	public Curve initialAgeDistribution;
	private Transform forestContainer;
	public int currentYear;
	public DensityMetric densityMetric;

	private void Awake()
	{
		if (Instance)
		{
			Destroy(gameObject);
		}
		else
		{
			ForestController.Instance = this;
		}
	}

	public void Respawn()
	{
		StopCoroutine(AnnualReproduction());

		if (ThreadedScaleUpdater.Instance)
		{
			ThreadedScaleUpdater.Instance.RemoveAll();
		}

		if (forestContainer)
		{
			MiscUtils.DeleteChildren(forestContainer);
		}

		for (int index = 0; index < foliageTypes.Length; index++)
		{
			foliageTypes[index].cummulativeTotalOfThisType = 0;
		}

		int seed = CustomMathf.GetRandomSeed();
		if (LevelController.Instance)
		{
			seed = LevelController.Instance.seed;
		}

		InitalSpawn(seed);
	}

	public void InitalSpawn(int seed)
	{
		if (!forestContainer)
		{
			forestContainer = new GameObject("Forest Container").transform;
			forestContainer.parent = transform;
		}

		foliageObjects = new List<FoliageObject>();
		terrainObjects = new List<TerrainObject>();
		terrainObjectContainers = new Transform[foliageTypes.Length];

		CancelInvoke();
		Vector2 sampleOffset = new Vector2(-mapSize.x / 2f, -mapSize.z / 2f);

		for (int foliageObjectType = 0; foliageObjectType < foliageTypes.Length; foliageObjectType++)
		{
			TerrainObjectType foliageObjectSettings = foliageTypes[foliageObjectType];
			terrainObjectContainers[foliageObjectType] = new GameObject(foliageObjectSettings.name + " Container").transform;
			terrainObjectContainers[foliageObjectType].parent = forestContainer;
			foliageObjectSettings.Initialize(terrainLayerMask, objectLayerMask, terrainObjectContainers[foliageObjectType], yearLength);
			foreach (Vector2 sample in new PoissonDiscSampler((int)mapSize.x, (int)mapSize.z, foliageObjectSettings.initialSpawnSampleRadius, foliageObjectSettings.poissonClusterRange, seed).Samples())
			{
				Vector3 position = new Vector3(sample.x + sampleOffset.x, maxTerrainHeight + 5f, sample.y + sampleOffset.x);
				AttemptSpawn(position, foliageObjectSettings, true, foliageObjectType > 0);
			}
		}

		InvokeRepeating("UpdateScores", 1f, scoreUpdateInterval);
//		InvokeRepeating("NewYear", 0.0f, yearLength);
	}

	public void AttemptSpawn (Vector3 samplePoint, TerrainObjectType terrainObjectSettings, bool randomAge, bool checkSurroundings)
	{
		float viability = terrainObjectSettings.TestViability(ref samplePoint, checkSurroundings);
		if (viability <= terrainObjectSettings.viabilitySettings.minViability)
		{
			return;
		}

		float viabilityPercentage = CustomMathf.RemapValue(viability, terrainObjectSettings.viabilitySettings.minViability, 1f, true);
		float num = !randomAge ? 0.0f : initialAgeDistribution.GetValue(Random.value) * terrainObjectSettings.dna.lifetime.minOutputValue * yearLength;
		var newObject = terrainObjectSettings.SpawnFoliageObject(samplePoint, Time.time - num, viabilityPercentage, reproduceAnnually);
		if (newObject.GetType() == typeof(FoliageObject))
		{
			AddFoliageObject((FoliageObject)newObject);
		}
		else
		{
			AddTerrainObject(newObject);
		}
	}

	public void NewYear()
	{
		currentYear++;
		StartCoroutine(AnnualReproduction());
	}
		
	public IEnumerator AnnualReproduction ()
	{
		for (int i = 0; i < foliageObjects.Count; i++)
		{
			if (i % reproductionAttemptsPerFrame == 0)
			{
				yield return 0f;
			}
//			if (terrainObjects[i]
			{
				foliageObjects[i].AnnualReproduction();
			}
		}
	}

	public void AddFoliageObject (FoliageObject newFoliageObject)
	{
		ThreadedScaleUpdater.Instance.AddFoliageObject(newFoliageObject);
		foliageObjects.Add(newFoliageObject);
	}

	public void RemoveFoliageObject (FoliageObject objectToRemove)
	{
		foliageObjects.Remove(objectToRemove);
	}

	public void AddTerrainObject (TerrainObject newTerrainObject)
	{
		terrainObjects.Add(newTerrainObject);
	}

	public void RemoveTerrainObject (TerrainObject objectToRemove)
	{
		terrainObjects.Remove(objectToRemove);
	}

	public void UpdateScores()
	{
		densityMetric.GetAverageDensity(foliageObjects);
		GameUI.Instance.UpdateScore(foliageObjects.Count, densityMetric.averageDensity, densityMetric.densityScore);
	}

	public void CreateInvoke(string method, float time)
	{
		Invoke(method, time);
	}
}