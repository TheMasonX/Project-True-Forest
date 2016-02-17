using UnityEngine;
using UnityEditor;
using NUnit.Framework;
using TMX.Utils;
using System.Collections.Generic;

public class CombineSubmeshes : ScriptableWizard
{
	public CombinedSubmeshes[] submeshesToCombine;

	[MenuItem("TMX/Mesh Utils/Combine Submeshes")]
	private static void CreateWizard ()
	{
		Transform selectedTransform = Selection.activeTransform;

		if (!selectedTransform)
			return;

		if (!selectedTransform.GetComponent<MeshFilter>())
			return;

		ScriptableWizard.DisplayWizard<CombineSubmeshes>("Edit Vertex Colors");
	}

	private void OnWizardCreate ()
	{
		Transform selectedTransform = Selection.activeTransform;
		Mesh editedMesh = InstanceMesh(selectedTransform.GetComponent<MeshFilter>().sharedMesh);

		string extension = "asset";

		string path = EditorUtility.SaveFilePanelInProject("Save Edited Mesh",
			selectedTransform.name + " Combined Submeshes",
			extension,
			"Specify where to save the edited mesh.");

		if (path.Length > 0)
		{
			if (submeshesToCombine.Length == 0)
				return;

			editedMesh = Combine(editedMesh);
			AssetDatabase.CreateAsset(editedMesh, path);
			AssetDatabase.SaveAssets();
			selectedTransform.GetComponent<MeshFilter>().sharedMesh = AssetDatabase.LoadAssetAtPath<Mesh>(path);
		}
	}

	static Mesh InstanceMesh (Mesh originalMesh)
	{
		Mesh newMesh = new Mesh ();
		newMesh = Instantiate(originalMesh);
		newMesh.name = originalMesh.name;
		return newMesh;
	}

	Mesh Combine (Mesh mesh)
	{
		Mesh combinedMesh = InstanceMesh(mesh);
		SubmeshInfo[] initialSubmeshData = new SubmeshInfo[mesh.subMeshCount];
		for (int submeshIndex = 0; submeshIndex < mesh.subMeshCount; submeshIndex++)
		{
			initialSubmeshData[submeshIndex].triangles = new List<int>();
			int[] submeshTriangles = mesh.GetTriangles(submeshIndex);
			for (int triangleIndex = 0; triangleIndex < submeshTriangles.Length; triangleIndex++)
			{
				initialSubmeshData[submeshIndex].triangles.Add(submeshTriangles[triangleIndex]);
			}
		}
		List<int> affectedSubmeshes = new List<int>();
		SubmeshInfo[] combinedSubInfo = new SubmeshInfo[submeshesToCombine.Length];
		for (int combinedSubmeshesIndex = 0; combinedSubmeshesIndex < submeshesToCombine.Length; combinedSubmeshesIndex++)
		{
			combinedSubInfo[combinedSubmeshesIndex].triangles = new List<int>();
			for (int affectedSubmeshesIndex = 0; affectedSubmeshesIndex < submeshesToCombine[combinedSubmeshesIndex].submeshesToCombine.Length; affectedSubmeshesIndex++)
			{
				int affectedSubmesh = submeshesToCombine[combinedSubmeshesIndex].submeshesToCombine[affectedSubmeshesIndex];
				combinedSubInfo[combinedSubmeshesIndex].triangles.AddRange(initialSubmeshData[affectedSubmesh].triangles);
				affectedSubmeshes.Add(affectedSubmesh);
			}
		}
		int unaffectedSubmeshCount = mesh.subMeshCount - affectedSubmeshes.Count;
		int newSubmeshCount = submeshesToCombine.Length + unaffectedSubmeshCount;
		combinedMesh.subMeshCount = newSubmeshCount;

		int currentSubmesh = 0;
		for (int combinedSubmeshesIndex = 0; combinedSubmeshesIndex < combinedSubInfo.Length; combinedSubmeshesIndex++)
		{
			combinedMesh.SetTriangles(combinedSubInfo[combinedSubmeshesIndex].triangles, currentSubmesh);
			currentSubmesh++;
		}
		for (int originalSubmeshIndex = 0; originalSubmeshIndex < mesh.subMeshCount; originalSubmeshIndex++)
		{
			if (!affectedSubmeshes.Contains(originalSubmeshIndex))
			{
				combinedMesh.SetTriangles(initialSubmeshData[originalSubmeshIndex].triangles, currentSubmesh);
				currentSubmesh++;
			}
		}
		return combinedMesh;
	}
}

[System.Serializable]
public class CombinedSubmeshes
{
	public int[] submeshesToCombine;
}

public struct SubmeshInfo
{
	public List<int> triangles;
}