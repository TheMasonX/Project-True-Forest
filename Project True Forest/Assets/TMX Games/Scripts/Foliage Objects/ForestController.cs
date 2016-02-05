using System.Collections;
using System.Collections.Generic;
using System.Diagnostics;
using TMX.Utils;
using UnityEngine;

public class ForestController : MonoBehaviour
{
	public static ForestController Instance;

	public float yearLength = 120f;
	public float ageUpdateInterval = 10f;
	public float scaleUpdateInterval = 0.25f;
	public float scoreUpdateInterval = 10f;
	public bool reproduceAnnually = true;
	public int reproductionAttemptsPerFrame = 200;
	public Vector3 mapSize;
	[HideInInspector]
	public float maxTerrainHeight;
	public int seed;
	public bool useSeed;
	public FoliageType[] foliageTypes;
	private Transform[] foliageContainers;
	private List<FoliageObject> foliageObjects;
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
			Invoke("Respawn", 0.01f);
		}
	}

	public void Respawn()
	{
		StopCoroutine(AnnualReproduction());

		if (forestContainer)
		{
			MiscUtils.DeleteChildren(forestContainer);
		}

		for (int index = 0; index < foliageTypes.Length; index++)
		{
			foliageTypes[index].cummulativeTotalOfThisType = 0;
		}

		InitalSpawn();
	}

	public void InitalSpawn()
	{
		if (!forestContainer)
		{
			forestContainer = new GameObject("Forest Container").transform;
			forestContainer.parent = transform;
		}

		foliageObjects = new List<FoliageObject>();
		foliageContainers = new Transform[foliageTypes.Length];

		if (!useSeed)
		{
			seed = CustomMathf.GetRandomSeed();
		}
		CancelInvoke();
		Vector2 sampleOffset = new Vector2(-mapSize.x / 2f, -mapSize.z / 2f);

		for (int foliageIndex = 0; foliageIndex < foliageTypes.Length; foliageIndex++)
		{
			List<CombinedObject> objectsOfType = new List<CombinedObject>();
			FoliageType foliageSettings = foliageTypes[foliageIndex];
			foliageContainers[foliageIndex] = new GameObject(foliageSettings.name + " Container").transform;
			foliageContainers[foliageIndex].parent = forestContainer;
			foliageSettings.Initialize(terrainLayerMask, objectLayerMask, foliageContainers[foliageIndex], yearLength);
			foreach (Vector2 sample in new PoissonDiscSampler((int)mapSize.x, (int)mapSize.z, foliageSettings.initialSpawnSampleRadius, seed).Samples())
			{
				Vector3 position = new Vector3(sample.x + sampleOffset.x, maxTerrainHeight + 5f, sample.y + sampleOffset.x);
				RaycastHit hitInfo;
				if (Physics.Raycast(position, Vector3.down, out hitInfo, maxTerrainHeight * 3f, terrainLayerMask))
				{
					position = hitInfo.point;
					float slope = Vector3.Angle(hitInfo.normal, Vector3.up);
					AttemptSpawn(position, slope, foliageSettings, true, foliageIndex > 0, ref objectsOfType);
				}
			}
		}

		InvokeRepeating("UpdateScores", 1f, scoreUpdateInterval);
		InvokeRepeating("NewYear", 0.0f, yearLength);
	}

	public void AttemptSpawn (Vector3 samplePoint, float slope, FoliageType foliageSettings, bool randomAge, bool checkSurroundings, ref List<CombinedObject> objectsOfType)
	{
		float viability = foliageSettings.TestViability(samplePoint, slope, objectLayerMask, checkSurroundings);
		if (viability <= foliageSettings.viabilitySettings.minViability)
		{
			return;
		}

		float viabilityPercentage = CustomMathf.RemapValue(viability, foliageSettings.viabilitySettings.minViability, 1f, true);
		float num = !randomAge ? 0.0f : initialAgeDistribution.GetValue(Random.value) * foliageSettings.dna.lifetime.minOutputValue * yearLength;
		foliageObjects.Add(foliageSettings.SpawnFoliageObject(samplePoint, Time.time - num, viabilityPercentage, reproduceAnnually));
		objectsOfType.Add(foliageObjects[foliageObjects.Count - 1].GetComponent<CombinedObject>());
	}

	public void NewYear()
	{
		currentYear++;
		StartCoroutine(AnnualReproduction());
	}
		
	public IEnumerator AnnualReproduction()
	{
		for (int i = 0; i < foliageObjects.Count; i++)
		{
			if (i % reproductionAttemptsPerFrame == 0)
			{
				yield return 0f;
			}
			foliageObjects[i].AnnualReproduction();
		}
	}

	public void AddFoliageObject(FoliageObject newFoliageObject)
	{
		foliageObjects.Add(newFoliageObject);
	}

	public void RemoveFoliageObject(FoliageObject objectToRemove)
	{
		foliageObjects.Remove(objectToRemove);
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