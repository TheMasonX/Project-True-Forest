using UnityEngine;
using UnityEditor;
using NUnit.Framework;
using TMX.Utils;

[CustomEditor(typeof(TerrainObjectType))]
public class FoliageTypeInspector : Editor
{
	public override void OnInspectorGUI ()
    {
		DrawDefaultInspector();

		EditorGUILayout.Space();

		var script = target as TerrainObjectType;

		if (GUILayout.Button("Fill In Blank DNA Size Settings From Prefab"))
		{
				script.FillInBlankDNASettings();
		}
    }
}
