using UnityEngine;
using System.Collections;
using TMX.Utils;

[System.Serializable]
public class DNA
{
	public bool grows = true;
	public float height;
	public float radius;
	public float objectDensity = 1f;
	public Curve scale;

	public Curve healthBySize;
	public Curve damageModifierFromViability;

	public float maxRollRotation;

	[Header("----- Foliage Only Settings -----")]
	public Curve lifetime;
	public Curve sizeOverLifetime;
	public float scaleDifferenceUpdatePercent = .075f;
	public float scaleSmoothTime = 1f;
	public int scaleSmoothingSteps = 5;

	public Curve reproductionViabilityOverLifetime;
	[Range(1, 5)]
	public int seedAttempts = 1;
	public Curve seedDispersalDistance;
	public Curve seedViabilityFromViability;
	public float reproductionInterval = 30f;
}