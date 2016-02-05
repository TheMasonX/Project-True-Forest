using UnityEngine;
using UnityEditor;
using NUnit.Framework;
using TMX.Utils;

public class VertexColorEditor : ScriptableWizard
{

	public VertexSettings vertexColorSettings;

	[MenuItem("TMX/Mesh Utils/Edit Vertex Colors")]
	private static void CreateWizard ()
	{
		Transform selectedTransform = Selection.activeTransform;

		if (!selectedTransform)
			return;

		if (!selectedTransform.GetComponent<MeshFilter>())
			return;

		ScriptableWizard.DisplayWizard<VertexColorEditor>("Edit Vertex Colors");
	}

	private void OnWizardCreate ()
	{
		Transform selectedTransform = Selection.activeTransform;
		Mesh editedMesh = InstanceMesh(selectedTransform.GetComponent<MeshFilter>().sharedMesh);

		string extension = "asset";

		string path = EditorUtility.SaveFilePanelInProject("Save Edited Mesh",
			selectedTransform.name + " Vertex Color Edit",
			extension,
			"Specify where to save the edited mesh.");

		if (path.Length > 0)
		{
			vertexColorSettings.EditVertexColors(ref editedMesh);
			editedMesh.RecalculateBounds();
			editedMesh.Optimize();
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
}

[System.Serializable]
public class VertexSettings
{
	public Curve valueByHeight;
	public Curve valueByDistance;

	public ColorChannel colorChannelToEdit;

	public void EditVertexColors (ref Mesh meshToEdit)
	{
		Color[] vertexColors = new Color[meshToEdit.vertexCount];
		for (int i = 0; i < meshToEdit.vertexCount; i++)
		{
			Vector3 vertex = meshToEdit.vertices[i];
			float distance = new Vector2 (vertex.x, vertex.z).magnitude;

			float value = valueByHeight.GetValue(vertex.y) * valueByDistance.GetValue(distance);
			vertexColors[i] = ColorUtils.AffectColorChannel(colorChannelToEdit, meshToEdit.colors[i], value);

		}
		meshToEdit.colors = vertexColors;
	}
}

//public class VertexSettings
//{
//	public Curve redByHeight;
//	public Curve greenByHeight;
//	public Curve blueByHeight;
//	public Curve alphaByHeight;
//
//	public Curve redByDistance;
//	public Curve greenByDistance;
//	public Curve blueByDistance;
//	public Curve alphaByDistance;
//
//	public void EditVertexColors (ref Mesh meshToEdit)
//	{
//		Color[] vertexColors = new Color[meshToEdit.vertexCount];
//		for (int i = 0; i < meshToEdit.vertexCount; i++)
//		{
//			Vector3 vertex = meshToEdit.vertices[i];
//			float distance = new Vector2 (vertex.x, vertex.z).magnitude;
//			Color heightColor = new Color (redByHeight.GetValue(vertex.y), greenByHeight.GetValue(vertex.y), blueByHeight.GetValue(vertex.y), alphaByHeight.GetValue(vertex.y));
//			Color distanceColor = new Color (redByDistance.GetValue(distance), greenByDistance.GetValue(distance), blueByDistance.GetValue(distance), alphaByDistance.GetValue(distance));
//			vertexColors[i] = heightColor * distanceColor;
//		}
//		meshToEdit.colors = vertexColors;
//	}
//}