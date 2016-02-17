using UnityEngine;
using System.Collections;
using TMX.Utils;

public class FireParticleEffect : MonoBehaviour
{
	public FireParticles[] particleSystems;
	public float particleUpdateInterval = .1f;
	[HideInInspector] public bool ignited = false;
	[HideInInspector] public FireCell cell;

	public void StartFire ()
	{
		ignited = true;
		for (int i = 0; i < particleSystems.Length; i++)
		{
			particleSystems[i].particles.Play();
		}

		InvokeRepeating("UpdateParticles", 0f, particleUpdateInterval + Random.Range(0f, .01f));
	}

	public void StopFire ()
	{
		ignited = false;
		CancelInvoke();

		for (int i = 0; i < particleSystems.Length; i++)
		{
			particleSystems[i].particles.Stop();
		}
	}

	public void UpdateParticles ()
	{
		for (int i = 0; i < particleSystems.Length; i++)
		{
			particleSystems[i].UpdateEmissionRate(ref cell);
		}
	}

	[ContextMenu("Set Max Emission Rates")]
	public void SetMaxEmissionRates ()
	{
		for (int i = 0; i < particleSystems.Length; i++)
		{
			particleSystems[i].emissionRateFromFuel.maxOutputValue = particleSystems[i].particles.emission.rate.constantMax;
		}
	}
}

[System.Serializable]
public class FireParticles
{
	public ParticleSystem particles;
	public Curve emissionRateFromFuel;

	public void UpdateEmissionRate (ref FireCell cell)
	{
		var emission = particles.emission;
		emission.rate = new ParticleSystem.MinMaxCurve(emissionRateFromFuel.GetValue(cell.fuelRemaining));
//		particles.emission = emission;
	}
}