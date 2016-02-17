using UnityEngine;
using UnityEditor;
using NUnit.Framework;
using TMX.Utils;

//[CustomPropertyDrawer(typeof(Curve))]
//public class CurvePropertyDrawer : PropertyDrawer
//{
//	bool expanded;
//	public override void OnGUI (Rect position, SerializedProperty property, GUIContent label)
//	{
//		EditorGUI.BeginProperty(position, label, property);
//
////		position = EditorGUI.PrefixLabel (position, GUIUtility.GetControlID (FocusType.Passive), label);
//
//		expanded = EditorGUI.Foldout(position, expanded, label.text += " (Curve)");
//
//		if (expanded)
//		{
//			EditorGUI.indentLevel++;
//			EditorGUILayout.PropertyField(property.FindPropertyRelative("curve"), GUIContent.none, GUILayout.Height(30f));
//
//			EditorGUILayout.LabelField("Min/Max Input Values:");
//			EditorGUILayout.BeginHorizontal();
//			EditorGUILayout.PropertyField(property.FindPropertyRelative("minInputValue"), GUIContent.none);
//			EditorGUILayout.PropertyField(property.FindPropertyRelative("maxInputValue"), GUIContent.none);
//			EditorGUILayout.EndHorizontal();
//
//			EditorGUILayout.LabelField("Min/Max Output Values:");
//			EditorGUILayout.BeginHorizontal();
//			EditorGUILayout.PropertyField(property.FindPropertyRelative("minOutputValue"), GUIContent.none);
//			EditorGUILayout.PropertyField(property.FindPropertyRelative("maxOutputValue"), GUIContent.none);
//			EditorGUILayout.EndHorizontal();
//
//			EditorGUI.indentLevel--;
//			EditorGUILayout.Space();
//			EditorGUILayout.Space();
//
//		}
//
//		EditorGUI.EndProperty();
//	}
//}
