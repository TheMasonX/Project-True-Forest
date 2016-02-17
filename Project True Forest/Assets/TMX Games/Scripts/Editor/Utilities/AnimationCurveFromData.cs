using UnityEngine;
using UnityEditor;
using TMX.Utils;

public class AnimationCurveFromData : ScriptableWizard
{
	public CurveDataHolder[] curveDataObjects;
	public float minValue;
	public float maxValue;

	public AnimationCurve generatedCurve;

	[MenuItem("TMX/Misc/AnimationCurveFromData")]
	private static void CreateWizard ()
	{
		ScriptableWizard.DisplayWizard<AnimationCurveFromData>("Generate Curve From Data", "Close", "Generate Animation Curve");
	}

	private void OnWizardCreate ()
	{
		
	}

	void OnWizardOtherButton ()
	{
		for (int i = 0; i < curveDataObjects.Length; i++)
		{
			float height = (curveDataObjects[i].GetValue() - minValue) / (maxValue - minValue);
			generatedCurve.AddKey((float)i / (float)(curveDataObjects.Length - 1f), height);
		}
	}
}

[System.Serializable]
public class CurveDataHolder
{
	public enum CurveDataType
	{
		FLOAT = 0,
		AVERAGE = 1
	}

	public CurveDataType dataType;
	public float value;
	public float[] values;

	public float GetValue ()
	{
		if (dataType == CurveDataType.FLOAT)
		{
			return value;
		}
		else
		{
			return CustomMathf.GetMean(values);
		}
	}
}

[CustomPropertyDrawer(typeof(CurveDataHolder))]
public class CurveDataHolderInspector : PropertyDrawer
{
	public override void OnGUI (Rect position, SerializedProperty property, GUIContent label)
	{
		label.text += ": ";
		EditorGUI.BeginProperty(position, label, property);

		position = EditorGUI.PrefixLabel (position, GUIUtility.GetControlID (FocusType.Passive), label);

		EditorGUILayout.PropertyField(property.FindPropertyRelative("dataType"));

		int dataType = property.FindPropertyRelative("dataType").enumValueIndex;
		if (dataType == 0)
		{
			EditorGUILayout.PropertyField(property.FindPropertyRelative("value"), true);
		}

		else if (dataType == 1)
		{
			EditorGUILayout.PropertyField(property.FindPropertyRelative("values"), true);
		}

		EditorGUILayout.Space();
		EditorGUILayout.Space();
		EditorGUILayout.Space();

		EditorGUI.EndProperty();
	}
}