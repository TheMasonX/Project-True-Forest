using UnityEngine;
using UnityEditor;
using System.IO;
using TMX.Utils;

public class StrengthenNormalMap : ScriptableWizard
{
	public Texture2D normalToEdit;
	public NormalEditSettings editSettings;
	[HideInInspector] Object selected;
	[HideInInspector] string originalPath;
	bool displayPreviews;
	float previewSize = 200f;


	[MenuItem("TMX/Textures/Strengthen Normal Map")]
	private static void CreateWizard ()
	{
		Object selectedObject = Selection.activeObject;

		ScriptableWizard.DisplayWizard<StrengthenNormalMap>("Edit Normal Map", "Save Changes", "Preview Changes");
		var window = (StrengthenNormalMap)EditorWindow.GetWindow(typeof(StrengthenNormalMap));

		if (selectedObject.GetType() == typeof(Texture2D))
		{
			window.Initialize(selectedObject);
		}
	}

	private void OnWizardCreate ()
	{
//		string path = EditorUtility.SaveFilePanelInProject("Save Edited Normal Map",
//			selected.name + " Edited",
//			"png",
//			"Specify where to save the edited normal map.");

		string path = EditorUtility.SaveFilePanel("Save Edited Normal Map",
			originalPath,
			selected.name + " Edited",
			"png");

		if (path.Length > 0)
		{
			editSettings.ModifyTexture();
			var encodedMap = editSettings.editedTexture.EncodeToPNG();
			File.WriteAllBytes(path, encodedMap);
			var savedNormal = AssetDatabase.LoadAssetAtPath<Texture2D>(path);
			AssetDatabase.Refresh();
			AssetDatabase.SaveAssets();
		}
	}

	void OnWizardOtherButton ()
	{
		if (!normalToEdit)
		{
			if (Selection.activeObject.GetType() == typeof(Texture2D))
			{
				Initialize(Selection.activeObject);
			}
		}
		if(!editSettings.editedTexture)
		{
			editSettings.Initialize(normalToEdit);
		}
		editSettings.ModifyTexture();
		displayPreviews = true;
	}

	protected override bool DrawWizardGUI ()
	{
		EditorGUILayout.HelpBox("IMPORTANT: Make sure the texture is marked as readable and not a normal map (hack for now) in the import settings", MessageType.Warning);
		displayPreviews = EditorGUILayout.Foldout(displayPreviews, "Display Previews");
		if (displayPreviews)
		{
			var lastRect = GUILayoutUtility.GetLastRect();
			Rect preview1 = new Rect (new Vector2(previewSize / 8f - 5f, lastRect.yMax + 20), new Vector2(previewSize, previewSize));
			Rect preview2 = new Rect (new Vector2(previewSize + previewSize / 8f + 5f, lastRect.yMax + 20), new Vector2(previewSize, previewSize));

			NoisePreview.DrawTexture(editSettings.editedTexture, preview1, previewSize);
			NoisePreview.DrawTexture(normalToEdit, preview2, previewSize);

			GUILayout.Space(previewSize + 25f);
		}

		return base.DrawWizardGUI();
	}

	void Initialize (Object selectedObject)
	{
		selected = selectedObject;
		normalToEdit = (Texture2D)selectedObject;
		originalPath = AssetDatabase.GetAssetPath(selectedObject);
		editSettings.Initialize(normalToEdit);
	}
}

[System.Serializable]
public struct NormalEditSettings
{
	public Curve strengthMultiplierBySlope;

	[HideInInspector] public Texture2D editedTexture;

	int width;
	int height;

	Color[] oldColors;

	public void Initialize (Texture2D originalTexture)
	{
		width = originalTexture.width;
		height = originalTexture.height;

		editedTexture = new Texture2D (width, height);
		oldColors = originalTexture.GetPixels();
	}

	public void ModifyTexture ()
	{
		Color[] newColors = new Color[width * height];

//		for (int x = 0; x < width; x++)
//		{
//			for (int y = 0; y < height; y++)
//			{
//				int pixelIndex = y * (width - 1) + x;
//				newColors[pixelIndex] = ModifyPixel(oldColors[pixelIndex], (x < 1 && y < 4));
//			}
//		}

		for (int i = 0; i < newColors.Length; i++)
		{
				newColors[i] = ModifyPixel(oldColors[i]);
		}
		editedTexture.SetPixels(newColors);
		editedTexture.Apply();
	}

	Color ModifyPixel (Color originalColor)
	{
		Vector3 colorAsNormal = new Vector3 (originalColor.r * 2f - 1f, originalColor.g * 2f - 1f, originalColor.b * 2f - 1f);
		float strengthMultiplier = strengthMultiplierBySlope.GetValue(Mathf.Abs(Vector3.Dot(colorAsNormal, Vector3.forward)));
		colorAsNormal.Normalize();
		colorAsNormal.x *= strengthMultiplier;
		colorAsNormal.y *= strengthMultiplier;
		float magnitude = colorAsNormal.magnitude;
		colorAsNormal.z /= magnitude;
		colorAsNormal.Normalize();
		colorAsNormal = new Vector3 ((colorAsNormal.x + 1f) / 2f, (colorAsNormal.y + 1f) / 2f, (colorAsNormal.z + 1f) / 2f);
		return new Color(colorAsNormal.x, colorAsNormal.y, colorAsNormal.z);
	}

	int DotTo8Bit (Vector3 a, Vector3 b)
	{
		return Mathf.RoundToInt((Vector3.Dot(a, b) + 1f) / 2f * 255);
	}
}