using UnityEngine;
using System.Collections;
using TMX.Utils;
using System.Collections.Generic;
using System.IO;
using UnityEditor;
using System;

public class TerrainGenerator : MonoBehaviour
{
	public static TerrainGenerator Instance;

	public float verticesPerMeter = 1f;
	[Range(0f, .25f)]
	public float borderPadding = .05f;

	public TerrainWallGenerator wallSettings;

	public ProceduralTerrainSettings proceduralTerrainSettings;

	public Material terrainMaterial;
	private GameObject terrainObject;
	public int terrainLayer = 8;

	private Vector3 mapSize;
	private Vector2Int gridSize;
	private float maxHeight;

	void Awake ()
	{
		if (Instance)
		{
			Destroy(gameObject);
			return;
		}
		Instance = this;

		GenerateMesh();
	}

	#region Mesh
	public void GenerateMesh ()
	{
		MiscUtils.DeleteChildren(transform);

		terrainObject = new GameObject ("Terrain");
		terrainObject.transform.parent = transform;
		terrainObject.layer = terrainLayer;

		mapSize = GetComponent<ForestController>().mapSize;
		mapSize.x *= 1f + borderPadding;
		mapSize.z *= 1f + borderPadding;

		proceduralTerrainSettings.GetNoise(mapSize);
		maxHeight = 0f;


		Vector3 vertexOffset = new Vector3 (-mapSize.x / 2f, 0f, -mapSize.z / 2f);
		gridSize = new Vector2Int ((int)(mapSize.x * verticesPerMeter) - 1, 
			                         (int)(mapSize.z * verticesPerMeter) - 1);

		//ensure the mesh isn't too high poly
		int totalVertCount = gridSize.x * gridSize.y;
		if (totalVertCount > 65535)
		{
			float resizePercent = 65530f / (float)totalVertCount;
			gridSize.x = Mathf.FloorToInt(resizePercent * gridSize.x);
			gridSize.y = Mathf.FloorToInt(resizePercent * gridSize.y);
		}

		Mesh mesh = new Mesh ();
		mesh.name = "Terrain";

		Vector3[] vertices = new Vector3[(gridSize.x + 1) * (gridSize.y + 1)];
		Vector2[] uv = new Vector2[vertices.Length];
		Vector4[] tangents = new Vector4[vertices.Length];
		Vector4 tangent = new Vector4(1f, 0f, 0f, -1f);

		for (int i = 0, y = 0; y <= gridSize.y; y++)
		{
			for (int x = 0; x <= gridSize.x; x++, i++)
			{
				uv[i] = new Vector2 ((float)x / (float)gridSize.x, (float)y / (float)gridSize.y);
				vertices[i] = SetVertex(x, y, vertexOffset, uv[i]);

				tangents[i] = tangent;
			}
		}

		mesh.vertices = vertices;
		mesh.uv = uv;
		mesh.tangents = tangents;

		int[] triangles = new int[gridSize.x * gridSize.y * 6];
		for (int ti = 0, vi = 0, y = 0; y < gridSize.y; y++, vi++)
		{
			for (int x = 0; x < gridSize.x; x++, ti += 6, vi++)
			{
				triangles[ti] = vi;
				triangles[ti + 3] = triangles[ti + 2] = vi + 1;
				triangles[ti + 4] = triangles[ti + 1] = vi + gridSize.x + 1;
				triangles[ti + 5] = vi + gridSize.x + 2;
			}
		}
		mesh.triangles = triangles;

		mesh.RecalculateNormals();
		mesh.RecalculateBounds();
		mesh.Optimize();

		terrainObject.AddComponent<MeshFilter>();
		terrainObject.GetComponent<MeshFilter>().sharedMesh = mesh;

		terrainObject.AddComponent<MeshCollider>();
		terrainObject.GetComponent<MeshCollider>().sharedMesh = mesh;

		terrainObject.AddComponent<MeshRenderer>();
		terrainObject.GetComponent<MeshRenderer>().sharedMaterial = terrainMaterial;

		GetComponent<ForestController>().maxTerrainHeight = maxHeight;

		wallSettings.GenerateInitialWalls(terrainObject.transform, mesh.vertices, gridSize, mapSize);

		Invoke("UpdateMaterial",0f);
	}

	Vector3 SetVertex (int x, int y, Vector3 offset, Vector2 uv)
	{
		Vector3 vertex = new Vector3 (x, 0f, y) / verticesPerMeter + offset;
		float vertexHeight = proceduralTerrainSettings.InterpolateValue(uv);
		vertex.y = vertexHeight;

		if (vertexHeight > maxHeight)
		{
			maxHeight = vertexHeight;
		}

		return vertex;
	}

	public void DeformMesh ()
	{
		if (!terrainObject)
		{
			GenerateMesh();
			return;
		}

		proceduralTerrainSettings.GetNoise(mapSize);

		Mesh mesh = terrainObject.GetComponent<MeshFilter>().sharedMesh;
		Vector3[] vertices = mesh.vertices;
		Vector2[] uv = mesh.uv;
		maxHeight = 0f;
		for (int i = 0; i < mesh.vertexCount; i++)
		{
			float height = proceduralTerrainSettings.InterpolateValue(uv[i]);
			vertices[i].y = height;
			if (height > maxHeight)
			{
				maxHeight = height;
			}
			
		}
		mesh.vertices = vertices;
		mesh.RecalculateNormals();
		mesh.RecalculateBounds();
		mesh.Optimize();

		terrainObject.GetComponent<MeshFilter>().sharedMesh = mesh;
		terrainObject.GetComponent<MeshCollider>().sharedMesh = mesh;

		GetComponent<ForestController>().maxTerrainHeight = maxHeight;

		Invoke("UpdateMaterial",0f);
	}
	#endregion

	public void UpdateMaterial ()
	{
		terrainMaterial.SetVector("_MapSize", new Vector4 (mapSize.x, maxHeight * .9f, mapSize.z, 0f));
	}

	public void AddBurntTexture (Texture2D burntTexture)
	{
		terrainMaterial.SetTexture("_BurntTexture", burntTexture);
	}
}