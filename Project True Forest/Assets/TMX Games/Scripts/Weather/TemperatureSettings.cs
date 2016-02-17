using UnityEngine;
using System.Collections;
using TMX.Utils;

[System.Serializable]
public class TemperatureSettings
{
	public Curve averageTemperatureOverYear;
	public AnimatedPerlinNoise temperatureFluctuationNoise;
	private float lastTemperatureRead;
	private float average;
	private float fluctuation;

	public void Initialize ()
	{
		temperatureFluctuationNoise.Initialize(CustomMathf.GetRandomSeed());
	}

	public float GetTemperature ()
	{
		average = averageTemperatureOverYear.GetValue(LevelController.Instance.calendar.timeOfYear);
		fluctuation = temperatureFluctuationNoise.GetAnimatedValue(Time.time - lastTemperatureRead);
		lastTemperatureRead = Time.time;
		return average + fluctuation;
	}
}
