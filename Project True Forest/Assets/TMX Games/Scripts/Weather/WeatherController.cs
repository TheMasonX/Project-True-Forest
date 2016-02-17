using UnityEngine;
using System.Collections;
using TMX.Utils;

public class WeatherController : MonoBehaviour
{
	public PrecipitationParticles rainParticles;
	public MeshRenderer clouds;

	public WaterCycle waterCycleSettings;

	[Range(0f,1f)]
	public float cloudCoverage;
	public Curve lightPercentFromCloudCoverage;

	public float cloudBlockingPercentage
	{
		get
		{
			return lightPercentFromCloudCoverage.GetValue(cloudCoverage);
		}
	}

	public Gradient cloudColorByStormPercent;

	public TemperatureSettings temperatureSettings;


	public void UpdateCloudLighting (float dayPercent, Light dominantLight)
	{
		clouds.sharedMaterial.SetFloat("_CloudCoverage", cloudCoverage);
		clouds.sharedMaterial.SetFloat("_DayPercent", dayPercent);
		var dominantLightDirection = dominantLight.transform.forward;
		clouds.sharedMaterial.SetVector("_DominantLightDirection", new Vector4(dominantLightDirection.x, dominantLightDirection.y, dominantLightDirection.z, dominantLight.color.a));
	}
}

[System.Serializable]
public class PrecipitationParticles
{
	public GameObject prefab;
	[HideInInspector] public GameObject instance;

	public void PrecipitationStart ()
	{
		if (!instance)
		{
			instance = GameObject.Instantiate(prefab, prefab.transform.position, prefab.transform.rotation) as GameObject;
		}
		var particles = instance.GetComponent<ParticleSystem>();
		var newEmissionSize = ForestController.Instance.mapSize;
		newEmissionSize.y = particles.shape.box.y;
		particles.shape.box.Set(newEmissionSize.x, newEmissionSize.z, 50f);
		particles.Play();
	}

	public void PrecipitationEnd ()
	{
		instance.GetComponent<ParticleSystem>().Stop(true);
	}
}