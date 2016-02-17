using UnityEngine;
using System.Collections;
using TMX.Utils;
using System.Collections.Generic;

public class FireController : MonoBehaviour
{
	public static FireController Instance;

	public float gridSize = 10f;
	public float burnTravelSpeed = 1f;
	public Curve burnSpreadChance;
	public float burnUpdateInterval = 1f;
	[HideInInspector] public Transform particlesContainer;
	public GameObject groundFireParticles;
	public Curve fuelFromCellDensity;
	public float maxFuelConsumptionRate;
	public float minFuel;
	public Curve damageOverTime;

	public BurntTextureSettings burntTextureSettings;

	public FireCell[,] cells;
	private int cellsX;
	private int cellsY;

	public List<FireCell> activeCells;
	public List<FireCell> depletedCells;

	private Vector3 mapSize;
	private Vector3 cellExtents;

	public void Awake ()
	{
		if (Instance)
		{
			Destroy(gameObject);
			return;
		}
		Instance = this;
		activeCells = new List<FireCell> ();
		depletedCells = new List<FireCell> ();
	}

	#region Fire Starting
	public void InitializeFireGrid()
	{
		activeCells = new List<FireCell> ();
		depletedCells = new List<FireCell> ();

		mapSize = ForestController.Instance.mapSize;
		mapSize.y = ForestController.Instance.maxTerrainHeight;
		cellsX = Mathf.FloorToInt(mapSize.x / gridSize);
		cellsY = Mathf.FloorToInt(mapSize.z / gridSize);
		cells = new FireCell[cellsX,cellsY];

		if (particlesContainer)
		{
			Destroy(particlesContainer.gameObject);
		}

		particlesContainer = new GameObject ("Fire Particles Container").transform;
		particlesContainer.parent = transform;

		burntTextureSettings.InitializeTexture(cellsX, cellsY);

		cellExtents = new Vector3 (gridSize / 2f, mapSize.y / 2f, gridSize / 2f);

		RaycastHit hit;
		for (int x = 0; x < cellsX; x++)
		{
			for (int y = 0; y < cellsY; y++)
			{
				Vector2Int gridPosition = new Vector2Int (x, y);
				Vector3 centerPoint = new Vector3 (((float)x / (float)cellsX - .5f) * mapSize.x,  
					mapSize.y + .5f, 
					((float)y / (float)cellsY - .5f) * mapSize.z);

				Vector3 normal = Vector3.up;
				if (Physics.Raycast(centerPoint, Vector3.down, out hit, mapSize.y + 20f, ForestController.Instance.terrainLayerMask))
				{
					centerPoint = hit.point;
					normal = hit.normal;
				}

				cells[x, y] = new FireCell (gridPosition, centerPoint, normal);
				cells[x, y].InitializeFuelInfo(cellExtents, fuelFromCellDensity);

				GameObject newGroundParticles = GameObject.Instantiate(groundFireParticles, centerPoint, Quaternion.LookRotation(normal)) as GameObject;
				newGroundParticles.name = groundFireParticles.name + " [" + x.ToString() + "," + y.ToString() + "]";
				newGroundParticles.transform.parent = particlesContainer;
				cells[x, y].groundParticles = newGroundParticles.GetComponent<FireParticleEffect>();
				cells[x, y].groundParticles.cell = cells[x, y];
			}
		}

	}

	public void CreateFire (Vector3 startingPoint)
	{
		Vector2Int startingCell = new Vector2Int(0,0);
		float closestDistance = Mathf.Infinity;

		//have to deactivate all cells before we add the adjacent cells in the next loop
		for (int x = 0; x < cellsX; x++)
		{
			for (int y = 0; y < cellsY; y++)
			{
				cells[x, y].activated = false;
			}
		}

		for (int x = 0; x < cellsX; x++)
		{
			for (int y = 0; y < cellsY; y++)
			{
				cells[x, y].InitializeFuelInfo(cellExtents, fuelFromCellDensity);
				AddAdjacentCells(cells[x, y]);

				float checkDistance = (cells[x, y].centerPoint - startingPoint).sqrMagnitude;
				if (checkDistance < closestDistance)
				{
					closestDistance = checkDistance;
					startingCell = cells[x, y].gridPosition;
				}
			}
		}

		IgniteCell(ref cells[startingCell.x, startingCell.y]);

		InvokeRepeating("UpdateFire", burnUpdateInterval, burnUpdateInterval);
	}

	[ContextMenu("Start New Fire")]
	public void StartRandomFire()
	{
		Vector3 halfMapSize = ForestController.Instance.mapSize / 2f;
		Vector3 startingPoint = new Vector3 (Random.Range(-halfMapSize.x, halfMapSize.x), halfMapSize.y, Random.Range(-halfMapSize.z, halfMapSize.z));
		CreateFire(startingPoint);
	}
	#endregion

	#region Fire Update
	float lastTime;
	void UpdateFire ()
	{
		StartCoroutine(FireCoroutine());
	}

	public IEnumerator FireCoroutine ()
	{
		float spreadDelay = gridSize / 2f / burnTravelSpeed;
		for (int i = 0; i < activeCells.Count; i++)
		{
			burntTextureSettings.ApplyColor(activeCells[i].gridPosition, burntTextureSettings.colorFromBurnTime.GetValue(Time.time - activeCells[i].burnStartTime));

			if (Time.time > activeCells[i].burnStartTime + spreadDelay)
			{
				AttemptSpread(activeCells[i]);
			}
			activeCells[i].fuelRemaining -= maxFuelConsumptionRate * burnUpdateInterval;
			float newDamage = damageOverTime.GetValue(Time.time - activeCells[i].burnStartTime) * burnUpdateInterval;
			for (int objectIndex = 0; objectIndex < activeCells[i].foliageObjects.Count; objectIndex++)
			{
				if (!activeCells[i].foliageObjects[objectIndex])
				{
					activeCells[i].foliageObjects.RemoveAt(objectIndex);
					objectIndex--;
					continue;
				}
				activeCells[i].foliageObjects[objectIndex].ApplyDamage(newDamage);
			}
			if (activeCells[i].fuelRemaining < minFuel)
			{
				activeCells[i].groundParticles.StopFire();
				depletedCells.Add(activeCells[i]);
				activeCells.RemoveAt(i);
			}
			if (i % 5 == 0)
			{
				yield return 0f;
			}
		}
		if (burntTextureSettings.modified)
		{
			burntTextureSettings.UpdateTexture();
		}
	}

	void AttemptSpread (FireCell initialCell)
	{
		for(int i = 0; i < initialCell.adjacentCells.Count; i++)
		{
			FireCell adjacentCell = GetCellFromV2Int(initialCell.adjacentCells[i]);
			if (adjacentCell.activated)
			{
				initialCell.adjacentCells.RemoveAt(i);
				i--;
				continue;
			}

			float spreadAttemptValue = Random.value * Vector3.Dot(initialCell.normal, adjacentCell.normal);
			if (spreadAttemptValue >= burnSpreadChance.GetValue(adjacentCell.fuelRemaining))
			{
				IgniteCell(ref adjacentCell);
				initialCell.adjacentCells.RemoveAt(i);
				i--;
				continue;
			}
		}
	}
	#endregion

	#region Cell Modification
	public void IgniteCell (ref FireCell newCell)
	{
		newCell.InitializeFuelInfo(cellExtents, fuelFromCellDensity);
		newCell.burnStartTime = Time.time;
		newCell.groundParticles.StartFire();
		newCell.activated = true;
		activeCells.Add(newCell);
	}

	public void AddAdjacentCells (FireCell initialCell)
	{
		int thisX = initialCell.gridPosition.x;
		int thisY = initialCell.gridPosition.y;

		for (int x = thisX - 1; x <= thisX + 1; x++)
		{
			if (x >= 0 && x < cellsX)
			{
				initialCell.adjacentCells.Add(new Vector2Int(x, thisY));
			}
			x++;
		}

		for (int y = thisY - 1; y <= thisY + 1; y++)
		{
			if (y >= 0 && y < cellsY)
			{
				initialCell.adjacentCells.Add(new Vector2Int(thisX, y));
			}
			y++;
		}
	}
	#endregion

	public FireCell GetCellFromV2Int (Vector2Int gridPoint)
	{
		return cells[gridPoint.x, gridPoint.y];
	}
}

[System.Serializable]
public class BurntTextureSettings
{
	public Texture2D burntTexture;
	public Color[] colors;
	public Curve colorFromBurnTime;
	public bool modified;
	public int textureUpdateDelay = 2;
	private int currentTextureUpdateCount;

	public void InitializeTexture (int width, int height)
	{
		burntTexture = new Texture2D (width, height);
		burntTexture.wrapMode = TextureWrapMode.Clamp;
		colors = new Color[width * height];

		MiscUtils.ResetTexture(ref burntTexture, ref colors, new Color(0f,0f,0f,0f));

		currentTextureUpdateCount = textureUpdateDelay;

		TerrainGenerator.Instance.AddBurntTexture(burntTexture);
	}

	public int GetColorIndexFromGridPosition (int x, int y)
	{
		return x + y * burntTexture.width;
	}

	public void ApplyColor (Vector2Int gridPosition, float color)
	{
		ApplyColor(gridPosition.x, gridPosition.y, color);
	}

	public void ApplyColor (Vector2 gridPosition, float color)
	{
		ApplyColor((int)gridPosition.x, (int)gridPosition.y, color);
	}

	public void ApplyColor (int x, int y, float color)
	{
		modified = true;
		colors[GetColorIndexFromGridPosition(x, y)].r = color;
	}

	public void UpdateTexture ()
	{
		if (currentTextureUpdateCount % textureUpdateDelay == 0)
		{
			burntTexture.SetPixels(colors);
			burntTexture.Apply();
			modified = false;
		}
	}
}