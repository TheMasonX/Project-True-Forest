using UnityEngine;
using System.Collections;
using TMX.Utils;

[System.Serializable]
public class WaterCycle
{
	public Curve evaporationRateByTemperature;
	public float surfaceWater;
	public float relativeHumidity;

	public float GetDewPoint (float surfaceTemp)
	{
		return surfaceTemp - .36f * (100f - relativeHumidity);
	}
}
