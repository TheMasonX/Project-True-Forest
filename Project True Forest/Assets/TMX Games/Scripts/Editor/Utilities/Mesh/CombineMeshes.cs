using UnityEditor;
using UnityEngine;
using System.Collections;
using TMX.Utils;
using System.Collections.Generic;

public class CombineMeshes : ScriptableWizard
{
	public List<Transform> meshesToCombine;

	[MenuItem("TMX/Mesh Utils/Combine Meshes")]
	private static void CreateWizard ()
	{
		GameObject[] selected = Selection.gameObjects;

		ScriptableWizard.DisplayWizard<CombineMeshes>("Combine Meshes");

		var window = (CombineMeshes)EditorWindow.GetWindow(typeof(CombineMeshes));
		window.meshesToCombine = new List<Transform> ();
		if (selected.Length > 0)
		{
			for (int i = 0; i < selected.Length; i++)
			{
				if (selected[i].GetComponent<MeshFilter>())
				{
					window.meshesToCombine.Add(selected[i].transform);
				}
			}
		}
	}

	private void OnWizardCreate ()
	{
		string path = EditorUtility.SaveFilePanelInProject("Save Combined Mesh",
			"Combined Mesh",
			"asset",
			"Specify where to save the combined mesh.");

		if (path.Length > 0)
		{
			Mesh editedMesh = Combine();
			AssetDatabase.CreateAsset(editedMesh, path);
			AssetDatabase.SaveAssets();
		}
	}

	private Mesh Combine ()
	{
		List<Vector3> vertices = new List<Vector3> ();
		List<Vector3> normals = new List<Vector3> ();
		List<Vector4> tangents = new List<Vector4> ();
		List<Color> vertexColors = new List<Color> ();
		List<Vector2> uv = new List<Vector2> ();
		List<Vector2> uv2 = new List<Vector2> ();
		List<Vector2> uv3 = new List<Vector2> ();
		List<Vector2> uv4 = new List<Vector2> ();
		List<int> tris = new List<int> ();

		int startingVertex = 0;
		for (int i = 0; i < meshesToCombine.Count; i++)
		{
			var currentMesh = meshesToCombine[i].GetComponent<MeshFilter>().sharedMesh;
			bool hasColors = currentMesh.colors.Length > 0;
			bool hasUV = currentMesh.uv.Length > 0;
			bool hasUV2 = currentMesh.uv2.Length > 0;
			bool hasUV3 = currentMesh.uv3.Length > 0;
			bool hasUV4 = currentMesh.uv4.Length > 0;
			for (int vertexIndex = 0; vertexIndex < currentMesh.vertexCount; vertexIndex++)
			{
				vertices.Add(meshesToCombine[i].TransformPoint(currentMesh.vertices[vertexIndex]));
				normals.Add(meshesToCombine[i].TransformVector(currentMesh.normals[vertexIndex]));
				tangents.Add(meshesToCombine[i].TransformVector(currentMesh.tangents[vertexIndex]));
				if (hasColors)
				{
					vertexColors.Add(currentMesh.colors[vertexIndex]);
				}
				else
				{
					vertexColors.Add(Color.black);
				}
				if (hasUV)
				{
					uv.Add(currentMesh.uv[vertexIndex]);
				}
				else
				{
					uv.Add(new Vector2(0,0));
				}
				if (hasUV2)
				{
					uv2.Add(currentMesh.uv2[vertexIndex]);
				}
				else
				{
					uv2.Add(new Vector2(0,0));
				}
				if (hasUV3)
				{
					uv3.Add(currentMesh.uv3[vertexIndex]);
				}
				else
				{
					uv3.Add(new Vector2(0,0));
				}
				if (hasUV4)
				{
					uv4.Add(currentMesh.uv4[vertexIndex]);
				}
				else
				{
					uv4.Add(new Vector2(0,0));
				}
			}
			for (int triangleIndex = 0; triangleIndex < currentMesh.triangles.Length; triangleIndex++)
			{
				tris.Add(currentMesh.triangles[triangleIndex] + startingVertex);
			}
			startingVertex += currentMesh.vertexCount;
		}

		Mesh combinedMesh = new Mesh();
		combinedMesh.name = "Combined Mesh";
		combinedMesh.vertices = vertices.ToArray();
		combinedMesh.normals = normals.ToArray();
		combinedMesh.tangents = tangents.ToArray();
		combinedMesh.colors = vertexColors.ToArray();
		combinedMesh.uv = uv.ToArray();
		combinedMesh.uv2 = uv2.ToArray();
		combinedMesh.uv3 = uv3.ToArray();
		combinedMesh.uv4 = uv4.ToArray();
		combinedMesh.triangles = tris.ToArray();
		combinedMesh.Optimize();
		combinedMesh.RecalculateBounds();
		return combinedMesh;
	}
}
