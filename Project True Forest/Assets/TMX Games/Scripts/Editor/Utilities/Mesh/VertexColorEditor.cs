using UnityEngine;
using UnityEditor;
using System.Collections;
using TMX.Utils;

public class VertexColorEditor : ScriptableWizard
{

	public VertexColorSettings vertexColorSettings;

	[HideInInspector] public Transform selected;
	[HideInInspector] public Mesh originalMesh;
	[HideInInspector] public Mesh editedMesh;

	[MenuItem("TMX/Mesh Utils/Edit Vertex Colors")]
	private static void CreateWizard ()
	{
		Transform selectedTransform = Selection.activeTransform;

		if (!selectedTransform)
			return;

		if (!selectedTransform.GetComponent<MeshFilter>())
			return;

		ScriptableWizard.DisplayWizard<VertexColorEditor>("Edit Vertex Colors", "Save Changes", "Preview Changes");
		var window = (VertexColorEditor)EditorWindow.GetWindow(typeof(VertexColorEditor));
		window.selected = selectedTransform;
		window.originalMesh = selectedTransform.GetComponent<MeshFilter>().sharedMesh;
	}

	private void OnWizardCreate ()
	{
		string extension = "asset";

		string path = EditorUtility.SaveFilePanelInProject("Save Edited Mesh",
			selected.name + " Vertex Color Edit",
			extension,
			"Specify where to save the edited mesh.");

		if (path.Length > 0)
		{
			editedMesh = EditMesh(originalMesh);
			AssetDatabase.CreateAsset(editedMesh, path);
			AssetDatabase.SaveAssets();
			selected.GetComponent<MeshFilter>().sharedMesh = AssetDatabase.LoadAssetAtPath<Mesh>(path);
		}
	}

	void OnWizardOtherButton ()
	{
		editedMesh = EditMesh(originalMesh);
		selected.GetComponent<MeshFilter>().mesh = editedMesh;
	}

	static Mesh InstanceMesh (Mesh originalMesh)
	{
		Mesh newMesh = new Mesh ();
		newMesh = Instantiate(originalMesh);
		newMesh.name = originalMesh.name;
		return newMesh;
	}

	Mesh EditMesh (Mesh originalMesh)
	{
		Mesh editedMesh = InstanceMesh(originalMesh);
		vertexColorSettings.EditVertexColors(ref editedMesh);
		editedMesh.RecalculateBounds();
		editedMesh.Optimize();
		return editedMesh;
	}
}

[System.Serializable]
public class VertexColorSettings
{
	public bool createColors;

	public Curve valueByHeight;
	public Curve valueByDistance;

	public ColorChannel colorChannelToEdit;

	public enum ValueCriteria
	{
		HEIGHT = 0,
		DISTANCE = 1,
		BOTH = 2
	}

	public ValueCriteria valueCriteria;

	public void EditVertexColors (ref Mesh meshToEdit)
	{
		if (createColors)
		{
			meshToEdit.colors = new Color[meshToEdit.vertexCount];
		}

		Color[] vertexColors = new Color[meshToEdit.vertexCount];
		for (int i = 0; i < meshToEdit.vertexCount; i++)
		{
			Vector3 vertex = meshToEdit.vertices[i];
			float distance = new Vector2 (vertex.x, vertex.z).magnitude;

			var previousColor = createColors ? Color.white : meshToEdit.colors[i];

			vertexColors[i] = ColorUtils.AffectColorChannel(colorChannelToEdit, previousColor, GetValue(vertex.y, distance));

		}
		meshToEdit.colors = vertexColors;
	}

	public float GetValue (float height, float distance)
	{
		float value = 1f;
		switch (valueCriteria)
		{
		case ValueCriteria.HEIGHT:
			value = valueByHeight.GetValue(height);
			break;
		case ValueCriteria.DISTANCE:
			value = valueByDistance.GetValue(distance);
			break;
		case ValueCriteria.BOTH:
			value = valueByHeight.GetValue(height) * valueByDistance.GetValue(distance);
			break;
		}
		return value;
	}
}

[CustomPropertyDrawer(typeof(VertexColorSettings))]
public class VertexSettingsInspector : PropertyDrawer
{
	public override void OnGUI (Rect position, SerializedProperty property, GUIContent label)
	{
		label.text += ": ";
		EditorGUI.BeginProperty(position, label, property);

		position = EditorGUI.PrefixLabel (position, GUIUtility.GetControlID (FocusType.Passive), label);

		EditorGUILayout.PropertyField(property.FindPropertyRelative("createColors"), new GUIContent("Reset Colors Then Apply"));

		EditorGUILayout.PropertyField(property.FindPropertyRelative("colorChannelToEdit"));

		EditorGUILayout.PropertyField(property.FindPropertyRelative("valueCriteria"));

		int criteriaEnumValue = property.FindPropertyRelative("valueCriteria").enumValueIndex;
		if (criteriaEnumValue == 0 || criteriaEnumValue == 2)
		{
			EditorGUILayout.PropertyField(property.FindPropertyRelative("valueByHeight"), true);
		}

		else if (criteriaEnumValue == 1 || criteriaEnumValue == 2)
		{
			EditorGUILayout.PropertyField(property.FindPropertyRelative("valueByDistance"), true);
		}

		EditorGUI.EndProperty();
	}
}