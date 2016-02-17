using UnityEngine;
using UnityEditor;
using System.Collections;

[CustomEditor(typeof(DayNightCycleManager))]
public class DayNightCycleInspector : Editor
{
	public override void OnInspectorGUI ()
	{
		DrawDefaultInspector();
		var script = target as DayNightCycleManager;

		EditorGUILayout.Space();

		script.debugRotationSelected = EditorGUILayout.Foldout(script.debugRotationSelected, "Debug Rotation In Editor");
		if (script.debugRotationSelected)
		{
			script.debugRotationLength = EditorGUILayout.FloatField("Length Of One Debug Rotation: ", script.debugRotationLength);

			if (!script.DebugRotationActive)
			{
				if (GUILayout.Button("Start Rotation"))
				{
					script.DebugRotationActive = true;
					EditorCoroutine.StartEditorCoroutine(DebugRotation(script));
				}
			}
			else if (GUILayout.Button("Stop Rotation"))
			{
				script.DebugRotationActive = false;
			}
		}
	}

	public static IEnumerator DebugRotation (DayNightCycleManager script)
	{
		while (script.DebugRotationActive)
		{
			script.DebugRotation();
			yield return 0f;
		}
	}
}
