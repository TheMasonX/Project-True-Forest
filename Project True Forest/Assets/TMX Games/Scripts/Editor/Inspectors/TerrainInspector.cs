using UnityEngine;
using System.Collections;
using UnityEditor;
using TMX.Utils;
using System.IO;

[CustomEditor(typeof(TerrainGenerator))]
public class TerrainInspector : Editor
{
	public override void OnInspectorGUI ()
	{
		DrawDefaultInspector();
		var script = target as TerrainGenerator;

		EditorGUILayout.Space();

		bool useSeed = script.proceduralTerrainSettings.useSeed = EditorGUILayout.Foldout(script.proceduralTerrainSettings.useSeed, "Use Assigned Seed");

		if (useSeed)
		{
			script.proceduralTerrainSettings.seed = EditorGUILayout.IntField("Seed", script.proceduralTerrainSettings.seed);
		}

		EditorGUILayout.Space();


		if (GUILayout.Button("--- Generate Terrain ---"))
		{
			script.GenerateMesh();
		}
	}
}