using UnityEngine;
using UnityEditor;
using NUnit.Framework;
using System;
using System.IO.Ports;
using TMX.Utils;

[CustomEditor(typeof(ForestController))]
public class ForestControllerInspector : Editor
{
	public override void OnInspectorGUI ()
	{
		DrawDefaultInspector();
		var script = target as ForestController;

		EditorGUILayout.Space();

//		if (GUILayout.Button("Random Seed"))
//		{
//			script.seed = CustomMathf.GetRandomSeed();
//		}

		if (GUILayout.Button("Respawn"))
		{
			script.Respawn();
		}
	}
}

//public class CreateNewFoliageObjectWindow : ScriptableWizard
//{
//	private FoliageType newFoliageObject;
//	public GameObject prefab;
//
//	[MenuItem("TMX Games/Create New Foliage Object")]
//	private static void CreateWizard ()
//	{
//		ScriptableWizard.DisplayWizard<CreateNewFoliageObjectWindow>("Create New Foliage Object");
//		var wizardWindow = (EditorWindow.GetWindow(typeof(CreateNewFoliageObjectWindow)) as CreateNewFoliageObjectWindow);
//		wizardWindow.newFoliageObject = new FoliageType ();
//	}
//
//	public void OnWizardCreate ()
//	{
//		string path = EditorUtility.SaveFilePanelInProject("Create New Foliage Object",
//			(prefab ? prefab.name : "New Foliage Object"),
//			"asset",
//			"Specify where to save new foliage object.");
//
//		if (path.Length > 0)
//		{
//			if (prefab)
//			{
//				newFoliageObject.prefab = prefab;
//				newFoliageObject.FillInBlankDNASettings();
//			}
//			AssetDatabase.CreateAsset(newFoliageObject, path);
//			AssetDatabase.SaveAssets();
//			EditorUtility.FocusProjectWindow();
//			Selection.activeObject = newFoliageObject;
//		}
//	}
//}
