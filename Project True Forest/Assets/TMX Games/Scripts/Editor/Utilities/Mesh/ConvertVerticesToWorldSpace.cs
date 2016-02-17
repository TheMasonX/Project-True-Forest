using UnityEngine;
using UnityEditor;
using NUnit.Framework;
using TMX.Utils;

public class ConvertVerticesToWorldSpace : ScriptableWizard
{

	[MenuItem("TMX/Mesh Utils/Convert To World Space")]
	private static void CreateWizard ()
	{
		Transform selectedTransform = Selection.activeTransform;

		if (!selectedTransform)
			return;

		if (!selectedTransform.GetComponent<MeshFilter>())
			return;

		ScriptableWizard.DisplayWizard<ConvertVerticesToWorldSpace>("Convert To World Space");
	}

	private void OnWizardCreate ()
	{
		Transform selectedTransform = Selection.activeTransform;
		Mesh editedMesh = InstanceMesh(selectedTransform.GetComponent<MeshFilter>().sharedMesh);

		string extension = "asset";

		string path = EditorUtility.SaveFilePanelInProject("Save Edited Mesh",
			selectedTransform.name + " World Space",
			extension,
			"Specify where to save the edited mesh.");

		if (path.Length > 0)
		{
			CovertToWorldSpace(ref editedMesh, selectedTransform);
			editedMesh.RecalculateBounds();
			editedMesh.Optimize();
			AssetDatabase.CreateAsset(editedMesh, path);
			AssetDatabase.SaveAssets();
			selectedTransform.GetComponent<MeshFilter>().sharedMesh = AssetDatabase.LoadAssetAtPath<Mesh>(path);
		}
	}

	static void CovertToWorldSpace (ref Mesh originalMesh, Transform meshTransform)
	{
		Vector3[] newVertices = new Vector3[originalMesh.vertexCount];
		Vector3[] newNormals = new Vector3[originalMesh.vertexCount];
		Vector4[] newTangents = new Vector4[originalMesh.vertexCount];
		for (int i = 0; i < originalMesh.vertexCount; i++)
		{
			newVertices[i] = meshTransform.TransformPoint(originalMesh.vertices[i]);
			newNormals[i] = meshTransform.TransformVector(originalMesh.normals[i]);
			newTangents[i] = meshTransform.TransformVector(originalMesh.tangents[i]);
		}
		originalMesh.vertices = newVertices;
		originalMesh.normals = newNormals;
		originalMesh.tangents = newTangents;
	}

	static Mesh InstanceMesh (Mesh originalMesh)
	{
		Mesh newMesh = new Mesh ();
		newMesh = Instantiate(originalMesh);
		newMesh.name = originalMesh.name;
		return newMesh;
	}
}