using UnityEngine;
using System.Collections;
using System.Collections.Generic;
using TMX.Utils;

public class FireCell
{
	public Vector2Int gridPosition;
	public Vector3 centerPoint;
	public Vector3 normal;
	public float totalArea;
	public float fuelRemaining;
	public float burnStartTime;
	public FireParticles groundParticles;

	public bool activated;

	[HideInInspector] public List<Vector2Int> adjacentCells;

	public List<FoliageObject> foliageObjects;

	public FireCell(Vector2Int _gridPosition, Vector3 _centerPoint, Vector3 _normal)
	{
		gridPosition = _gridPosition;
		centerPoint = _centerPoint;
		normal = _normal;
		adjacentCells = new List<Vector2Int>();
	}

	public void Initialize (Vector3 cellExtents, Curve fuelFromCellDensity)
	{
		foliageObjects = new List<FoliageObject>();
		Collider[] nearbyObjects = Physics.OverlapBox(centerPoint, cellExtents, Quaternion.Euler(Vector3.zero), ForestController.Instance.objectLayerMask);
		for (int i = 0; i < nearbyObjects.Length; i++)
		{
			var foliageObject = nearbyObjects[i].transform.GetComponentInParent<FoliageObject>();
			if (!foliageObject)
			{
				continue;
			}
			totalArea += foliageObject.GetArea();
			foliageObjects.Add(foliageObject);
		}
		fuelRemaining = fuelFromCellDensity.GetValue(totalArea / (cellExtents.x * cellExtents.x * 4f));
	}
}
