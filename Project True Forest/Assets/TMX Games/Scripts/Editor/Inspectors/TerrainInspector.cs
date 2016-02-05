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

		script.proceduralTerrainSettings.useSeed = EditorGUILayout.Foldout(script.proceduralTerrainSettings.useSeed, "Use Adjustable Seed");
		if (script.proceduralTerrainSettings.useSeed)
		{
			script.proceduralTerrainSettings.seed = EditorGUILayout.IntField(script.proceduralTerrainSettings.seed);
			EditorGUILayout.Space();
		}

		if (GUILayout.Button("Generate Terrain"))
		{
			script.GenerateMesh();
		}

		if (GUILayout.Button("Deform Terrain (No Mesh Generation)"))
		{
			script.DeformMesh();
		}
	}
}