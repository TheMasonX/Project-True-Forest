using UnityEngine;
using System.Collections;
using TMX.Utils;

[System.Serializable]
public class FoliageType : MonoBehaviour
{
	public DNA dna;
	public ViabilitySettings viabilitySettings;
	public GameObject prefab;
	public float initialSpawnSampleRadius = 20f;
	[HideInInspector] public Transform container;

	private LayerMask terrainLayerMask;
	private LayerMask objectLayerMask;
	[HideInInspector] public float yearLength;

	[HideInInspector] public int cummulativeTotalOfThisType = 1;

	public void Initialize (LayerMask terrainMask, LayerMask objectMask, Transform foliageContainer, float newYearLength)
	{
		terrainLayerMask = terrainMask;
		objectLayerMask = objectMask;
		container = foliageContainer;
		yearLength = newYearLength;
	}

	public FoliageObject SpawnFoliageObject (Vector3 position, float spawnTime, float viabilityPercentage, bool reproduceAnnually)
	{
		GameObject newFoliageObject = GameObject.Instantiate(prefab, position, Quaternion.Euler(0f, Random.Range(0f, 360f), 0f)) as GameObject;

		newFoliageObject.name = prefab.name + " #" + cummulativeTotalOfThisType.ToString();
		newFoliageObject.transform.parent = container;
		cummulativeTotalOfThisType++;

		var foliageObject = newFoliageObject.GetComponent<FoliageObject>();
		foliageObject.Initialize(this, spawnTime, viabilityPercentage, reproduceAnnually);

		return foliageObject;
	}

	public void FillInBlankDNASettings ()
	{
		if (!prefab)
			return;
		MeshRenderer[] renderers = prefab.transform.GetComponentsInChildren<MeshRenderer>();
		float largestHeight = 0f;
		float largestWidth = 0f;
		for (int i = 0; i < renderers.Length; i++)
		{
			largestHeight = Mathf.Max(renderers[i].bounds.extents.y * 2f, largestHeight);
			largestWidth = Mathf.Max((renderers[i].bounds.extents.x + renderers[i].bounds.extents.z) / 2f, largestWidth);
		}
		if (dna.height == 0f)
			dna.height = largestHeight;
		if (dna.radius == 0f)
			dna.radius = largestWidth;
	}

	public float TestViability (ref Vector3 position, bool checkSurroundings, float viabilityModifier = 1f)
	{
		return TestViability(position, CustomMathf.GetSlopeAtPoint(ref position, terrainLayerMask, 200f), checkSurroundings, viabilityModifier);
	}

	public float TestViability (Vector3 position, float slope, bool checkSurroundings, float viabilityModifier = 1f)
	{
		return TestViability(position, slope, objectLayerMask, checkSurroundings, viabilityModifier);
	}

	public float TestViability (Vector3 position, float slope, LayerMask objectLayers, bool checkSurroundings, float viabilityModifier = 1f)
	{
		return viabilitySettings.TestViability(position, slope, objectLayers, checkSurroundings, viabilityModifier);
	}
}