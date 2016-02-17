using UnityEngine;
using System.Collections;
using TMX.Utils;
using System.Runtime.InteropServices;

public class FoliageObject : TerrainObject
{
	public float maxHealth;
	public float lostHealth;

	private float age
	{
		get
		{
			var value = Time.time - timeOfCreation;
			if (value > predictedLifetime)
			{
				Debug.Log(name + " Died of Old Age");
				Death();
			}
			return value;
		}
	}
	private float predictedLifetime = Mathf.Infinity;
	private float agePercent
	{
		get { return age / predictedLifetime; }
	}

	public override void Initialize (TerrainObjectType foliageType, float spawnTime, float viablityPercent, bool annualReproduction)
	{
		base.Initialize(foliageType, spawnTime, viablityPercent, annualReproduction);
		reproduceAnnually = annualReproduction;

		updateSmoothingStepPercent = 1f / (float)foliageType.dna.scaleSmoothingSteps;
		updateSmoothingStepInterval = foliageType.dna.scaleSmoothTime * updateSmoothingStepPercent;
		predictedLifetime = selfTerrainObjectType.dna.lifetime.GetValue(viability) * foliageType.yearLength;

		objectContainer.localScale = GetAgedScale();

		maxHealth = selfTerrainObjectType.dna.healthBySize.GetValue(scale);

	}

	#region Scale Control
	private float updateSmoothingStepPercent;
	private float updateSmoothingStepInterval;
	private Vector3 oldScale;
	private Vector3 newScale;
	private float smoothingPercent;
	public void UpdateScale (float newScaleFloat)
	{
		oldScale = objectContainer.localScale;
		newScale = baseScale * newScaleFloat;
		smoothingPercent = 0f;
	}

	public void SmoothScale ()
	{
		smoothingPercent += updateSmoothingStepPercent;
		objectContainer.localScale = Vector3.Lerp(oldScale, newScale, smoothingPercent);
		if (smoothingPercent < 1f)
		{
			Invoke("SmoothScale", updateSmoothingStepInterval);
		}
	}

	public Vector3 GetAgedScale ()
	{
		return baseScale * GetAgedScaleFloat();
	}

	public float GetAgedScaleFloat()
	{
		return scale = selfTerrainObjectType.dna.sizeOverLifetime.GetValue(agePercent);
	}

	//used by the threaded scale updater
	public float GetAgedScaleFloat(float time)
	{
		return scale = selfTerrainObjectType.dna.sizeOverLifetime.GetValue((time - timeOfCreation) / predictedLifetime);
	}
	#endregion

	#region Reproduction
	private bool reproductionStarted;
	private bool reproduceAnnually;
	public IEnumerator ReproductionCoroutine ()
	{
		while (age < predictedLifetime)
		{
			for (int i = 0; i < selfTerrainObjectType.dna.seedAttempts; i++)
			{
				AttemptToReproduce();
				yield return 0f;
			}
			yield return new WaitForSeconds (selfTerrainObjectType.dna.reproductionInterval * Random.Range(.95f, 1.1f));
		}
	}

	public void AnnualReproduction ()
	{
		if (age / predictedLifetime < selfTerrainObjectType.dna.reproductionViabilityOverLifetime.minInputValue)
		{
			return;
		}

		for (int i = 0; i < selfTerrainObjectType.dna.seedAttempts; i++)
		{
			AttemptToReproduce();
		}
	}

	public void AttemptToReproduce ()
	{
		float seedDispersalDistance = selfTerrainObjectType.dna.seedDispersalDistance.GetValue(Random.value);
		float seedAngle = Random.Range(0f, Mathf.PI * 2f);
		Vector3 seedSamplePoint = transform.position + new Vector3 (Mathf.Cos(seedAngle) * seedDispersalDistance, 0f, Mathf.Sin(seedAngle) * seedDispersalDistance);
		seedSamplePoint.y = ForestController.Instance.maxTerrainHeight + 10f;

		float viabilityModifier = selfTerrainObjectType.dna.reproductionViabilityOverLifetime.GetValue(age / predictedLifetime) * selfTerrainObjectType.dna.seedViabilityFromViability.GetValue(viability);
		float seedViability = selfTerrainObjectType.TestViability(ref seedSamplePoint, true, viabilityModifier);

		if (seedViability >= selfTerrainObjectType.viabilitySettings.minViability)
		{
			ForestController.Instance.AddTerrainObject(selfTerrainObjectType.SpawnFoliageObject(seedSamplePoint, Time.time, seedViability, reproduceAnnually));
		}
	}
	#endregion

	#region Health
	public override void Death ()
	{
		ForestController.Instance.RemoveFoliageObject(this);
		GameObject.Destroy(gameObject);
	}

	public override void ApplyDamage (float damage)
	{
		damage *= selfTerrainObjectType.dna.damageModifierFromViability.GetValue(viability);
		lostHealth += damage;
		if (lostHealth >= maxHealth)
		{
			Death();
		}
	}
	#endregion
}