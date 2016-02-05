using UnityEngine;
using System.Collections;
using TMX.Utils;
using System.Runtime.InteropServices;

public class FoliageObject : MonoBehaviour
{
	public DNA dna;
	public float timeOfCreation;
	public Vector3 baseScale;
	private float scale;
	public float viability;
	private FoliageType selfFoliageType;
	private float baseArea;
	private float baseVolume;

	public float maxHealth;
	public float lostHealth;

	private float age
	{
		get { return Time.time - timeOfCreation; }
	}
	private float predictedLifetime;
	private float agePercent
	{
		get { return age / predictedLifetime; }
	}

	private bool reproductionStarted;
	private bool reproduceAnnually;

	private float ageUpdateInterval;
	private float scaleUpdateInterval;
	private float instantScaleSnapSqrMagnitude;

	private Vector3 oldScale;
	private Vector3 newScale;

	public void Initialize (FoliageType foliageType, float spawnTime, float viablityPercent, bool annualReproduction)
	{
		selfFoliageType = foliageType;
		dna = foliageType.dna;
		timeOfCreation = spawnTime;
		viability = viablityPercent;
		reproduceAnnually = annualReproduction;
		scale = dna.scale.GetValue(viability);
		baseArea = Mathf.PI * (dna.radius) * (dna.radius) * scale;
		baseVolume = baseArea * dna.height * dna.objectDensity;
		baseScale = transform.localScale * scale;

		predictedLifetime = dna.lifetime.GetValue(viability) * foliageType.yearLength;

		transform.localScale = GetAgedScale();

		maxHealth = dna.healthBySize.GetValue(scale);

		if (Application.isPlaying)
		{
			ageUpdateInterval = ForestController.Instance.ageUpdateInterval;
			scaleUpdateInterval = ForestController.Instance.scaleUpdateInterval;

			StartCoroutine(UpdateAge());
		}
	}


	public IEnumerator UpdateAge ()
	{
		yield return new WaitForSeconds (age % ageUpdateInterval);
		while (age < predictedLifetime)
		{
			newScale = GetAgedScale();
			maxHealth = dna.healthBySize.GetValue(scale);

			if (!reproductionStarted && !reproduceAnnually)
			{
				if (agePercent >= dna.reproductionViabilityOverLifetime.minInputValue)
				{
					reproductionStarted = true;
					StartCoroutine(ReproductionCoroutine());
				}
			}

			if (agePercent <= dna.instantGrowthAgePercent)
			{
				oldScale = transform.localScale;

				float scaleUpdateTime = 0f;
				while (scaleUpdateTime < ageUpdateInterval)
				{
					scaleUpdateTime += scaleUpdateInterval;
					transform.localScale = Vector3.Lerp(oldScale, newScale, scaleUpdateTime / ageUpdateInterval);
					yield return new WaitForSeconds (scaleUpdateInterval);
				}
			}
			else
			{
				transform.localScale = newScale;
				yield return new WaitForSeconds (ageUpdateInterval);
			}
		}
		Death();
	}

	public Vector3 GetAgedScale ()
	{
		scale = dna.sizeOverLifetime.GetValue(agePercent);
		return baseScale * scale;
	}

	public IEnumerator ReproductionCoroutine ()
	{
		while (age < predictedLifetime)
		{
			for (int i = 0; i < dna.seedAttempts; i++)
			{
				AttemptToReproduce();
				yield return 0f;
			}
			yield return new WaitForSeconds (dna.reproductionInterval * Random.Range(.95f, 1.1f));
		}
	}

	public void AnnualReproduction ()
	{
		if (age / predictedLifetime < dna.reproductionViabilityOverLifetime.minInputValue)
		{
			return;
		}

		for (int i = 0; i < dna.seedAttempts; i++)
		{
			AttemptToReproduce();
		}
	}

	public void AttemptToReproduce ()
	{
		float seedDispersalDistance = dna.seedDispersalDistance.GetValue(Random.value);
		float seedAngle = Random.Range(0f, Mathf.PI * 2f);
		Vector3 seedSamplePoint = transform.position + new Vector3 (Mathf.Cos(seedAngle) * seedDispersalDistance, 0f, Mathf.Sin(seedAngle) * seedDispersalDistance);
		seedSamplePoint.y = ForestController.Instance.maxTerrainHeight + 10f;

//		Debug.DrawRay(seedSamplePoint, Vector3.down * 30f, Color.red, 10f);

		float viabilityModifier = dna.reproductionViabilityOverLifetime.GetValue(age / predictedLifetime) * dna.seedViabilityFromViability.GetValue(viability);
		float seedViability = selfFoliageType.TestViability(ref seedSamplePoint, true, viabilityModifier);
		//				Debug.Log("Reproduction Attempt. Distance: " + seedDispersalDistance + " || Viability: " + seedViability);

		if (seedViability >= selfFoliageType.viabilitySettings.minViability)
		{
			ForestController.Instance.AddFoliageObject(selfFoliageType.SpawnFoliageObject(seedSamplePoint, Time.time, seedViability, reproduceAnnually));
		}
	}

	public void Death ()
	{
		ForestController.Instance.RemoveFoliageObject(this);
		GameObject.Destroy(gameObject);
	}

	public float GetArea()
	{
		return baseArea * scale;
	}

	public float GetVolume()
	{
		return baseVolume * scale;
	}

	public void ApplyDamage (float damage)
	{
		damage *= dna.damageModifierFromViability.GetValue(viability);
		lostHealth += damage;
//		Debug.Log("Health Remaining: " + (maxHealth - lostHealth));
		if (lostHealth >= maxHealth)
		{
			Death();
		}
	}
}