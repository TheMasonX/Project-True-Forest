using UnityEngine;
using System.Collections;
using TMX.Utils;

[System.Serializable]
public class DNA
{
	public float height;
	public float radius;
	public float objectDensity = 1f;
	public Curve scale;
	public Curve lifetime;
	public Curve sizeOverLifetime;
	public Curve healthBySize;
	public Curve damageModifierFromViability;
	public float instantGrowthAgePercent = .25f;

	public Curve reproductionViabilityOverLifetime;
	[Range(1, 5)]
	public int seedAttempts = 1;
	public Curve seedDispersalDistance;
	public Curve seedViabilityFromViability;
	public float reproductionInterval = 30f;
}