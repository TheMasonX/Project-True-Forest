using UnityEngine;
using System.Collections;
using TMX.Utils;

public class FireLight : MonoBehaviour
{
	private Light light;
	private float updateInterval = .1f;

	public Curve intensityAnimation;
	public Curve rangeAnimation;
	public Curve particleCountModifier;
	public ParticleSystem particles;

	void Awake ()
	{
		light = GetComponent<Light>();
		if (EffectsManager.Instance.displayFireLights)
		{
			light.enabled = true;
			InvokeRepeating("UpdateLight", 0f, updateInterval);
		}
		else
		{
			light.enabled = false;
		}
	}
	
	void UpdateLight ()
	{
		float intensity = intensityAnimation.GetValue(Time.time % intensityAnimation.maxInputValue);
		float range = rangeAnimation.GetValue(Time.time + .12312f % rangeAnimation.maxInputValue);
		float particlesModifier = particleCountModifier.GetValue(particles.particleCount);
		light.range = range * particlesModifier;
		light.intensity = intensity * particlesModifier;
	}
}
