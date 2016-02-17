using UnityEngine;
using UnityEditor;
using TMX.Utils;

public class CustomHelper : EditorWindow
{
	public bool showTerrainOptions;
	public bool showDayNightOptions;
	public void OnGUI ()
    {
		showTerrainOptions = EditorGUILayout.Foldout(showTerrainOptions, "Terrain Options");
		if (showTerrainOptions)
		{
			TerrainGUI();
		}
		showDayNightOptions = EditorGUILayout.Foldout(showDayNightOptions, "Day Night Options");
		if (showDayNightOptions)
		{
			DayNightGUI();
		}

    }

	#region Submenus
	void TerrainGUI ()
	{
		var terrain = GameObject.FindObjectOfType<TerrainGenerator>();
		var levelController = GameObject.FindObjectOfType<LevelController>();

		EditorGUILayout.BeginHorizontal();
		if (GUILayout.Button("Generate From Seed"))
		{
			terrain.proceduralTerrainSettings.useSeed = true;
			terrain.GenerateMesh();
		}

		if (GUILayout.Button("Generate Random Terrain"))
		{
			terrain.proceduralTerrainSettings.seed = CustomMathf.GetRandomSeed();
			terrain.GenerateMesh();
		}
		EditorGUILayout.EndHorizontal();


		EditorGUILayout.BeginHorizontal();
		terrain.proceduralTerrainSettings.seed = EditorGUILayout.IntField(terrain.proceduralTerrainSettings.seed);

		if (GUILayout.Button("Randomize Seed"))
		{
			terrain.proceduralTerrainSettings.seed = CustomMathf.GetRandomSeed();
		}
		EditorGUILayout.EndHorizontal();

		if (GUILayout.Button("Generate Flow Map"))
		{
			terrain.GenerateFlowMap();
			terrain.ChangeTerrainShaderToRainy();
		}

		EditorGUILayout.Separator();
	}

	void DayNightGUI ()
	{
		EditorGUI.indentLevel++;
		var dayNightManager = DayNightCycleManager.Instance;
		if (dayNightManager)
		{
			dayNightManager.debugRotationSelected = EditorGUILayout.Foldout(dayNightManager.debugRotationSelected, "Debug Auto Rotation In Editor");
			if (dayNightManager.debugRotationSelected)
			{
				EditorGUI.indentLevel++;
				dayNightManager.debugRotationLength = EditorGUILayout.FloatField("Debug Rotation Length: ", dayNightManager.debugRotationLength);

				if (!dayNightManager.DebugRotationActive)
				{
					if (GUILayout.Button("Start Rotation"))
					{
						dayNightManager.DebugRotationActive = true;
						EditorCoroutine.StartEditorCoroutine(DayNightCycleInspector.DebugRotation(dayNightManager));
					}
				}
				else if (GUILayout.Button("Pause Rotation"))
				{
					dayNightManager.DebugRotationActive = false;
				}
				EditorGUI.indentLevel--;
			}
		}
		EditorGUI.indentLevel--;
		EditorGUILayout.Separator();
	}
	#endregion

	[MenuItem("TMX/Create Custom Helper")]
	static void Initialize ()
	{
		CustomHelper window  = (CustomHelper)EditorWindow.GetWindow(typeof(CustomHelper), false, "Custom Helper");
	}
}
