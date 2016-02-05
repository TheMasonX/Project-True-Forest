using UnityEngine;
using System.Collections;

public class CombinedObject : MonoBehaviour
{
	public Transform meshObject;
	[HideInInspector] public Vector3[] originalVertices;
	[HideInInspector] public int triangleCount;
	[HideInInspector] public int vertexStartIndex;
	[HideInInspector] public int triangleStartIndex;
	[HideInInspector] public int combinedObjectIndex;

	public Vector3[] GetWorldSpaceVertices ()
	{
		Vector3[] worldSpaceVertices = meshObject.GetComponent<MeshFilter>().mesh.vertices;
		for (int i = 0; i < worldSpaceVertices.Length; i++)
		{
			worldSpaceVertices[i] = meshObject.TransformPoint(worldSpaceVertices[i]);
		}
		return worldSpaceVertices;
	}
}
