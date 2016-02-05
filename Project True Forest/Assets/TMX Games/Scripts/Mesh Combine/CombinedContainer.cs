using UnityEngine;
using System.Collections;
using System.Collections.Generic;

public class CombinedContainer : MonoBehaviour
{
	public Mesh combinedMesh;
	public List<Vector3> vertices;
	public List<Vector3> normals;
	public List<Vector2> uvs;
	public List<Vector4> tangents;

	public int submeshCount;
	public Submesh[] submeshes;
	public int triangleCount;
	public List<CombinedObject> combinedObjects;
	private int maxVertexCount = 60000; //max is 65535

	public void CombineObjects (ref List<CombinedObject> newObjects)
	{
		vertices = new List<Vector3>();
		normals = new List<Vector3>();
		uvs = new List<Vector2>();
		tangents = new List<Vector4>();
		combinedObjects = new List<CombinedObject>();

		Transform meshObject;
		Mesh mesh;
		submeshCount = newObjects[0].meshObject.GetComponent<MeshFilter>().sharedMesh.subMeshCount;
		submeshes = new Submesh[submeshCount];
		for (int submeshIndex = 0; submeshIndex < submeshCount; submeshIndex++)
		{
			submeshes[submeshIndex].triangles = new List<int>();
		}

		MeshRenderer meshRenderer = newObjects[0].meshObject.GetComponent<MeshRenderer>();
		Vector3[] worldSpaceVertices;
		int totalVertexCount = 0;
		triangleCount = 0;

		for (int newObjectIndex = 0; newObjectIndex < newObjects.Count; newObjectIndex++)
		{
			meshObject = newObjects[newObjectIndex].meshObject;
			mesh = meshObject.GetComponent<MeshFilter>().mesh;

			if (totalVertexCount + mesh.vertexCount > maxVertexCount)
			{
				newObjects.RemoveRange(0, newObjectIndex);
				CreateMesh(meshRenderer);
				return;
			}

			//set up the index references
			newObjects[newObjectIndex].originalVertices = mesh.vertices;
			newObjects[newObjectIndex].triangleCount = mesh.triangles.Length;
			int vertexStartIndex = vertices.Count;
			newObjects[newObjectIndex].vertexStartIndex = vertexStartIndex;
			newObjects[newObjectIndex].triangleStartIndex = triangleCount;
			newObjects[newObjectIndex].combinedObjectIndex = combinedObjects.Count;

			//add the mesh info
			worldSpaceVertices = newObjects[newObjectIndex].GetWorldSpaceVertices();
			for(int vertexIndex = 0; vertexIndex < worldSpaceVertices.Length; vertexIndex++)
			{
				vertices.Add(worldSpaceVertices[vertexIndex]);
				normals.Add(mesh.normals[vertexIndex]);
				uvs.Add(mesh.uv[vertexIndex]);
				tangents.Add(mesh.tangents[vertexIndex]);
			}
			for (int submeshIndex = 0; submeshIndex < submeshCount; submeshIndex++)
			{
				int[] submeshTriangles = mesh.GetTriangles(submeshIndex);
				for (int triangleIndex = 0; triangleIndex < submeshTriangles.Length; triangleIndex++)
				{
					submeshes[submeshIndex].triangles.Add(vertexStartIndex + submeshTriangles[triangleIndex]);
					triangleCount++;
				}
			}
			totalVertexCount += mesh.vertexCount;

			meshObject.gameObject.SetActive(false);

			combinedObjects.Add(newObjects[newObjectIndex]);
		}
		newObjects.RemoveRange(0, newObjects.Count);
		CreateMesh(meshRenderer);
	}

	public void CreateMesh (MeshRenderer rendererToCopy)
	{
		gameObject.AddComponent<MeshFilter>();
		gameObject.AddComponent<MeshRenderer>();
		gameObject.GetComponent<MeshRenderer>().sharedMaterials = rendererToCopy.sharedMaterials;

		combinedMesh = new Mesh ();
		combinedMesh.name = "Combined Mesh";
		UpdateMesh();
		GetComponent<MeshFilter>().sharedMesh = combinedMesh;
	}

	public void UpdateMesh ()
	{
		combinedMesh.Clear();
		combinedMesh.vertices = vertices.ToArray();
		combinedMesh.normals = normals.ToArray();
		combinedMesh.uv = uvs.ToArray();
		combinedMesh.tangents = tangents.ToArray();
		combinedMesh.subMeshCount = submeshes.Length;
		for (int submeshIndex = 0; submeshIndex < submeshes.Length; submeshIndex++)
		{
			combinedMesh.SetTriangles(submeshes[submeshIndex].triangles.ToArray(), submeshIndex);
		}
	}
}

public struct Submesh
{
	public List<int> triangles;
}