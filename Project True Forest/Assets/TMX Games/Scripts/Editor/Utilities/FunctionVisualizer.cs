using UnityEngine;
using UnityEditor;
using NUnit.Framework;

public class FunctionVisualizer : EditorWindow
{

//	public enum FunctionType
//	{
//		Hermite,
//		Sinerp,
//		Coserp,
//		Exponential,
//
//	}

	[MenuItem ("TMX/FunctionVisualizer")]
	public static void CreateWindow ()
	{
		FunctionVisualizer window = (FunctionVisualizer)EditorWindow.GetWindow (typeof (FunctionVisualizer));
		window.Show();
	}

	void OnGUI ()
	{
	}

	void FunctionToVisualize (float input)
	{

	}
}
