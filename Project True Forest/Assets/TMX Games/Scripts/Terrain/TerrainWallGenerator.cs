using UnityEngine;
using System.Collections;
using TMX.Utils;
using System.Collections.Generic;

[System.Serializable]
public class TerrainWallGenerator
{
	public Material wallMaterial;
	[Range(0f, 200f)]
	public float wallDepth = 50f;
	[Range(0f, 200f)]
	public float UVScale = 100f;
	private float horizontalTiles;

	[Range(1,4)]
	public int heightSegments = 2;

	public PerlinNoise normalBumpiness;
	public VertexDisplacement vertexDisplacementSettings;

	private int tangentDirection = -1;

	//main terrain values
	Transform terrainObject;
	Vector3[] terrainVertices;
	Vector2Int gridSize;
	Vector3 mapSize;

	//walls 
	Transform wallContainer;
	GameObject leftWall;
	GameObject rightWall;
	GameObject frontWall;
	GameObject backWall;

	#region Initial Setup
	public void GenerateInitialWalls (Transform newTerrainObject, Vector3[] newTerrainVertices, Vector2Int newGridSize, Vector3 newMapSize)
	{
		terrainObject = newTerrainObject;
		terrainVertices = newTerrainVertices;
		gridSize = newGridSize;
		mapSize = newMapSize;

		normalBumpiness.Initialize(CustomMathf.GetRandomSeed());
		vertexDisplacementSettings.displacementNoise.Initialize(CustomMathf.GetRandomSeed());

		CreateWallObjects();
		CreateWallMeshes();
	}

	void CreateWallObjects ()
	{
		wallContainer = new GameObject ("Terain Walls").transform;
		wallContainer.parent = terrainObject;

		leftWall = NewWallObject("Left Terrain Wall");
		rightWall = NewWallObject("Right Terrain Wall");
		frontWall = NewWallObject("Front Terrain Wall");
		backWall = NewWallObject("Back Terrain Wall");
	}

	GameObject NewWallObject (string wallName)
	{
		GameObject newWall = new GameObject (wallName);
		newWall.transform.parent = wallContainer;

		newWall.AddComponent<MeshFilter>();
		newWall.AddComponent<MeshRenderer>();
		newWall.GetComponent<MeshRenderer>().sharedMaterial = wallMaterial;
		return newWall;
	}
	#endregion

	#region Mesh Generation
	void CreateWallMeshes ()
	{
		LeftRight_WallMesh();
		FrontBack_WallMesh();
	}

	#region LEFT_RIGHT
	void LeftRight_WallMesh ()
	{
		Mesh leftMesh = new Mesh ();
		leftMesh.name = "Left Wall Mesh";
		Mesh rightMesh = new Mesh ();
		rightMesh.name = "Right Wall Mesh";

		horizontalTiles = Mathf.Ceil(mapSize.z / UVScale);

		int vertCount = (gridSize.y + 1) * (heightSegments + 1);
		Vector3[] leftVertices = new Vector3[vertCount];
		Vector3[] rightVertices = new Vector3[vertCount];

		Vector3[] leftNormals = new Vector3[vertCount];
		Vector3[] rightNormals = new Vector3[vertCount];

		Vector2[] leftUVs = new Vector2[vertCount];
		Vector2[] rightUVs = new Vector2[vertCount];

		Vector4[] leftTangents = new Vector4[vertCount];
		Vector4[] rightTangents = new Vector4[vertCount];


		int vertexIndex = 0;
		for (int y = 0; y <= gridSize.y; y++)
		{
			int leftIndex = y * (gridSize.x + 1);
			int rightIndex = leftIndex + gridSize.x;

			Vector3 leftTopPosition = terrainVertices[leftIndex];
			Vector3 rightTopPosition = terrainVertices[rightIndex];

			for (int segment = 0; segment <= heightSegments; segment++)
			{
				int segmentIndex = vertexIndex + segment;
				float segmentPercent = (float)segment / (float)heightSegments;
				float horizontalPercent = (float)y / (float)gridSize.y;

				leftVertices[segmentIndex] = leftTopPosition;
				rightVertices[segmentIndex] = rightTopPosition;

				leftVertices[segmentIndex].y = Mathf.Lerp(-wallDepth, leftTopPosition.y, segmentPercent);
				rightVertices[segmentIndex].y = Mathf.Lerp(-wallDepth, rightTopPosition.y, segmentPercent);

				//normals
				leftNormals[segmentIndex] = GetBumpyNormal(Vector3.left, Vector3.up, Vector3.forward, leftVertices[segmentIndex]);
				rightNormals[segmentIndex] = GetBumpyNormal(Vector3.right, Vector3.up, Vector3.forward, rightVertices[segmentIndex]);


				//top and sides stay still to maintain seamless mesh
				if (segment < heightSegments && y != 0 && y != gridSize.y)
				{
					leftVertices[segmentIndex] += leftNormals[segmentIndex] * vertexDisplacementSettings.GetDisplacement(leftVertices[segmentIndex], horizontalPercent, wallDepth);
					rightVertices[segmentIndex] += rightNormals[segmentIndex] * vertexDisplacementSettings.GetDisplacement(rightVertices[segmentIndex], horizontalPercent, wallDepth);
				}

				//UVs
				float leftMaxV = (leftTopPosition.y + wallDepth) / UVScale;
				float rightMaxV = (rightTopPosition.y + wallDepth) / UVScale;
				float u = horizontalPercent * horizontalTiles;
				leftUVs[segmentIndex] = new Vector2 (u, Mathf.Lerp(0f, leftMaxV, segmentPercent));
				rightUVs[segmentIndex] = new Vector2 (-u, Mathf.Lerp(0f, rightMaxV, segmentPercent));


				//tangents
				leftTangents[segmentIndex] = new Vector4 (0f, 0f, 1f, tangentDirection);
				rightTangents[segmentIndex] = new Vector4 (0f, 0f, -1f, tangentDirection);
			}

			vertexIndex += (heightSegments + 1);
		}
		leftMesh.vertices = leftVertices;
		rightMesh.vertices = rightVertices;

		leftMesh.normals = leftNormals;
		rightMesh.normals = rightNormals;

		leftMesh.uv = leftUVs;
		rightMesh.uv = rightUVs;

		leftMesh.tangents = leftTangents;
		rightMesh.tangents = rightTangents;

		int quadCount = (gridSize.y);
		List<int> leftTris = new List<int>();
		List<int> rightTris = new List<int>();

		for (int quadIndex = 0; quadIndex < quadCount; quadIndex++)
		{
			int quadStartIndex = quadIndex * (heightSegments + 1);
			for (int segmentIndex = 0; segmentIndex < heightSegments; segmentIndex++)
			{
				int segmentStartIndex = quadStartIndex + segmentIndex;

				//left
				leftTris.Add(segmentStartIndex);
				leftTris.Add(segmentStartIndex + 2 + heightSegments);
				leftTris.Add(segmentStartIndex + 1);

				leftTris.Add(segmentStartIndex);
				leftTris.Add(segmentStartIndex + 1 + heightSegments);
				leftTris.Add(segmentStartIndex + 2 + heightSegments);

				//right
				rightTris.Add(segmentStartIndex);
				rightTris.Add(segmentStartIndex + 1);
				rightTris.Add(segmentStartIndex + 2 + heightSegments);

				rightTris.Add(segmentStartIndex);
				rightTris.Add(segmentStartIndex + 2 + heightSegments);
				rightTris.Add(segmentStartIndex + 1 + heightSegments);
			}
		}

		leftMesh.triangles = leftTris.ToArray();
		rightMesh.triangles = rightTris.ToArray();

		leftMesh.RecalculateBounds();
		leftMesh.RecalculateNormals();
		leftMesh.Optimize();

		rightMesh.RecalculateBounds();
		rightMesh.RecalculateNormals();
		rightMesh.Optimize();

		leftWall.GetComponent<MeshFilter>().sharedMesh = leftMesh;
		rightWall.GetComponent<MeshFilter>().sharedMesh = rightMesh;
	}
	#endregion

	#region FRONT_BACK
	void FrontBack_WallMesh ()
	{
		Mesh frontMesh = new Mesh ();
		frontMesh.name = "Front Wall Mesh";
		Mesh backMesh = new Mesh ();
		backMesh.name = "Back Wall Mesh";

		horizontalTiles = Mathf.Ceil(mapSize.x / UVScale);

		int vertCount = (gridSize.x + 1) * (heightSegments + 1);
		Vector3[] frontVertices = new Vector3[vertCount];
		Vector3[] backVertices = new Vector3[vertCount];

		Vector3[] frontNormals = new Vector3[vertCount];
		Vector3[] backNormals = new Vector3[vertCount];

		Vector2[] frontUVs = new Vector2[vertCount];
		Vector2[] backUVs = new Vector2[vertCount];

		Vector4[] frontTangents = new Vector4[vertCount];
		Vector4[] backTangents = new Vector4[vertCount];


		int vertexIndex = 0;
		for (int x = 0; x <= gridSize.x; x++)
		{
			int frontIndex = (gridSize.y + 1) * (gridSize.x) + x;
			int backIndex = x;

			Vector3 frontTopPosition = terrainVertices[frontIndex];
			Vector3 backTopPosition = terrainVertices[backIndex];

			for (int segment = 0; segment <= heightSegments; segment++)
			{
				int segmentIndex = vertexIndex + segment;
				float segmentPercent = (float)segment / (float)heightSegments;
				float horizontalPercent = (float)x / (float)gridSize.x;

				frontVertices[segmentIndex] = frontTopPosition;
				backVertices[segmentIndex] = backTopPosition;

				frontVertices[segmentIndex].y = Mathf.Lerp(-wallDepth, frontTopPosition.y, segmentPercent);
				backVertices[segmentIndex].y = Mathf.Lerp(-wallDepth, backTopPosition.y, segmentPercent);

				//normals
				frontNormals[segmentIndex] = GetBumpyNormal(Vector3.forward, Vector3.up, Vector3.right, frontVertices[segmentIndex]);
				backNormals[segmentIndex] = GetBumpyNormal(Vector3.back, Vector3.up, Vector3.right, backVertices[segmentIndex]);
				
				//top and sides stay still to maintain seamless mesh
				if (segment < heightSegments && x != 0 && x != gridSize.x)
				{
					frontVertices[segmentIndex] += frontNormals[segmentIndex] * vertexDisplacementSettings.GetDisplacement(frontVertices[segmentIndex], horizontalPercent, wallDepth);
					backVertices[segmentIndex] += backNormals[segmentIndex] * vertexDisplacementSettings.GetDisplacement(backVertices[segmentIndex], horizontalPercent, wallDepth);
				}

				//UVs
				float frontMaxV = (frontTopPosition.y + wallDepth) / UVScale;
				float backMaxV = (backTopPosition.y + wallDepth) / UVScale;
				float u = (float)x / (float)gridSize.x * horizontalTiles;
				frontUVs[segmentIndex] = new Vector2 (u, Mathf.Lerp(0f, frontMaxV, segmentPercent));
				backUVs[segmentIndex] = new Vector2 (-u, Mathf.Lerp(0f, backMaxV, segmentPercent));


				//tangents
				frontTangents[segmentIndex] = new Vector4 (1f, 0f, 0f, tangentDirection);
				backTangents[segmentIndex] = new Vector4 (-1f, 0f, 0f, tangentDirection);
			}

			vertexIndex += (heightSegments + 1);
		}
		frontMesh.vertices = frontVertices;
		backMesh.vertices = backVertices;

		frontMesh.normals = frontNormals;
		backMesh.normals = backNormals;

		frontMesh.uv = frontUVs;
		backMesh.uv = backUVs;

		frontMesh.tangents = frontTangents;
		backMesh.tangents = backTangents;

		int quadCount = (gridSize.x);
		List<int> frontTris = new List<int>();
		List<int> backTris = new List<int>();

		for (int quadIndex = 0; quadIndex < quadCount; quadIndex++)
		{
			int quadStartIndex = quadIndex * (heightSegments + 1);
			for (int segmentIndex = 0; segmentIndex < heightSegments; segmentIndex++)
			{
				int segmentStartIndex = quadStartIndex + segmentIndex;

				//front
				frontTris.Add(segmentStartIndex);
				frontTris.Add(segmentStartIndex + 2 + heightSegments);
				frontTris.Add(segmentStartIndex + 1);

				frontTris.Add(segmentStartIndex);
				frontTris.Add(segmentStartIndex + 1 + heightSegments);
				frontTris.Add(segmentStartIndex + 2 + heightSegments);

				//back
				backTris.Add(segmentStartIndex);
				backTris.Add(segmentStartIndex + 1);
				backTris.Add(segmentStartIndex + 2 + heightSegments);

				backTris.Add(segmentStartIndex);
				backTris.Add(segmentStartIndex + 2 + heightSegments);
				backTris.Add(segmentStartIndex + 1 + heightSegments);
			}
		}

		frontMesh.triangles = frontTris.ToArray();
		backMesh.triangles = backTris.ToArray();

		frontMesh.RecalculateBounds();
		frontMesh.RecalculateNormals();
		frontMesh.Optimize();

		backMesh.RecalculateBounds();
		backMesh.RecalculateNormals();
		backMesh.Optimize();

		frontWall.GetComponent<MeshFilter>().sharedMesh = frontMesh;
		backWall.GetComponent<MeshFilter>().sharedMesh = backMesh;
	}
	#endregion

	Vector3 GetBumpyNormal (Vector3 trueNormal, Vector3 offsetDirection1, Vector3 offsetDirection2, Vector3 position)
	{
		return (trueNormal + offsetDirection1 * normalBumpiness.GetValue(position) + offsetDirection2 * normalBumpiness.GetValue(-position));
	}

	#endregion

	public void UpdateWalls (Vector3[] newTerrainVertices)
	{
		terrainVertices = newTerrainVertices;
	}
}

[System.Serializable]
public class VertexDisplacement
{
	public PerlinNoise displacementNoise;
	public Curve verticalEffect;
	public Curve horizontalEffect;

	public float GetDisplacement(Vector3 position, float horizontalPercent, float minHeight)
	{
		return displacementNoise.GetValue(position) * horizontalEffect.GetValue(horizontalPercent) * verticalEffect.GetValue(position.y + minHeight);
	}
}