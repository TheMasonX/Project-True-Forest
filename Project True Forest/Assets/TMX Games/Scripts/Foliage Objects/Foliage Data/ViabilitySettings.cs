using UnityEngine;
using System.Collections;
using TMX.Utils;

[System.Serializable]
public class ViabilitySettings
{
	public Curve slopeModifier;
	public Curve heightModifier;
	public Curve openSpaceModifier;
	public Curve otherObjectVolumeModifier;
	[Range(0f,1f)]
	public float failureRate;
	public float minViability;

	public float TestViability (Vector3 position, float slope, LayerMask objectLayers, bool checkSurroundings, float viabilityModifier = 1f)
	{
		if (Random.value <= failureRate)
		{
			return 0f;
		}

		float viability = slopeModifier.GetValue(slope);
		viability *= heightModifier.GetValue(position.y) * viabilityModifier;

		if (viability >= minViability)
		{
			//if there's a fire, make sure not to spawn anywhere near it
			if (FireManager.Instance.activeCells.Count > 0)
			{
				foreach (FireCell activeCell in FireManager.Instance.activeCells)
				{
					if ((activeCell.centerPoint - position).magnitude <= FireManager.Instance.gridSize * 2f)
					{
						viability = 0f;
						break;
					}
				}
			}
		}

		if (viability >= minViability && checkSurroundings)
		{
			Collider[] nearbyObjects = Physics.OverlapSphere(position, openSpaceModifier.maxInputValue, objectLayers);
			for (int i = 0; i < nearbyObjects.Length; i++)
			{
				float distance = Vector3.Distance(position, nearbyObjects[i].transform.position);
				viability *= openSpaceModifier.GetValue(distance) * otherObjectVolumeModifier.GetValue(nearbyObjects[i].transform.parent.GetComponent<FoliageObject>().GetVolume());
			}
		}

		return viability;
	}
}
