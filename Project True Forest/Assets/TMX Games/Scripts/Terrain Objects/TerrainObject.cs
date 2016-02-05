using UnityEngine;
using System.Collections;

public class TerrainObject : MonoBehaviour
{
	[HideInInspector] public TerrainObjectType selfTerrainObjectType;
	[HideInInspector] public float timeOfCreation;
	[HideInInspector] public float viability;
	[HideInInspector] public Transform objectContainer;
	[HideInInspector] public Vector3 baseScale;
	[HideInInspector] public float scale;

	[HideInInspector] public float baseArea;
	[HideInInspector] public float baseVolume;

	public virtual void Initialize (TerrainObjectType foliageType, float spawnTime, float viablityPercent, bool annualReproduction)
	{
		viability = viablityPercent;
		selfTerrainObjectType = foliageType;
		timeOfCreation = spawnTime;
		scale = selfTerrainObjectType.dna.scale.GetValue(viability);

		objectContainer = transform.GetChild(0);
		objectContainer.localScale = baseScale = objectContainer.localScale * scale;

		baseArea = Mathf.PI * (selfTerrainObjectType.dna.radius) * (selfTerrainObjectType.dna.radius) * scale;
		baseVolume = baseArea * selfTerrainObjectType.dna.height * selfTerrainObjectType.dna.objectDensity;
	}

	public virtual void ApplyDamage (float damage)
	{

	}

	public virtual void Death ()
	{

	}

	public float GetArea()
	{
		return baseArea * scale;
	}

	public float GetVolume()
	{
		return baseVolume * scale;
	}
}
