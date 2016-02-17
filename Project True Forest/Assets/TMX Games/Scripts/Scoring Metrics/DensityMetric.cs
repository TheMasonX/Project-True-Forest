using UnityEngine;
using System.Collections;
using TMX.Utils;
using System.Collections.Generic;

[System.Serializable]
public class DensityMetric
{
	public Curve scoreFromDensity;
	public Curve distanceFactor;
	public Curve volumeFactor;

	private float density;
	public float averageDensity;
	public float densityScore;

	public void GetAverageDensity (List<FoliageObject> foliageObjects)
	{
		averageDensity = 0f;
		for (int j = 0; j < foliageObjects.Count; j++)
		{
			averageDensity += foliageObjects[j].GetArea();
		}
		averageDensity /= ForestController.Instance.mapSize.x * ForestController.Instance.mapSize.z; 
		densityScore = scoreFromDensity.GetValue(averageDensity);
	}
}
