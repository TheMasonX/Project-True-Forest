using UnityEngine;
using System.Collections;
using UnityEditor;
using System.IO;

public class GrayscaleToColor : ScriptableWizard
{
	public Texture2D grayscaleTexture;
	public GradientSettings gradient;
	[HideInInspector] Object selected;
	[HideInInspector] string originalPath;
	[HideInInspector] public Texture2D editedTexture;
	int width;
	int height;
	Color[] oldColors;

	//debug preview settings
	bool displayPreviews;
	float previewSize = 200f;


	[MenuItem("TMX/Textures/Convert Grayscale To Color Using Gradient")]
	private static void CreateWizard ()
	{
		Object selectedObject = Selection.activeObject;

		ScriptableWizard.DisplayWizard<GrayscaleToColor>("Edit Texture", "Save Changes", "Preview Changes");
		var window = (GrayscaleToColor)EditorWindow.GetWindow(typeof(GrayscaleToColor));

		if (selectedObject.GetType() == typeof(Texture2D))
		{
			window.Initialize(selectedObject);
		}
	}

	private void OnWizardCreate ()
	{
		string path = EditorUtility.SaveFilePanel("Save Edited Normal Map",
			originalPath,
			selected.name + " Colored",
			"png");

		if (path.Length > 0)
		{
			ModifyTexture();
			var encodedMap = editedTexture.EncodeToPNG();
			File.WriteAllBytes(path, encodedMap);
			AssetDatabase.Refresh();
			AssetDatabase.SaveAssets();
		}
	}

	void OnWizardOtherButton ()
	{
		if (!grayscaleTexture)
		{
			if (Selection.activeObject.GetType() == typeof(Texture2D))
			{
				Initialize(Selection.activeObject);
			}
		}
		else if(!editedTexture)
		{
			Initialize(grayscaleTexture);
		}
		ModifyTexture();
		displayPreviews = true;
	}

	protected override bool DrawWizardGUI ()
	{
		EditorGUILayout.HelpBox("IMPORTANT: Make sure the texture is marked as readable in the import settings", MessageType.Warning);
		displayPreviews = EditorGUILayout.Foldout(displayPreviews, "Display Previews");
		if (displayPreviews)
		{
			var lastRect = GUILayoutUtility.GetLastRect();
			Rect preview1 = new Rect (new Vector2(previewSize / 8f - 5f, lastRect.yMax + 20), new Vector2(previewSize, previewSize));
			Rect preview2 = new Rect (new Vector2(previewSize + previewSize / 8f + 5f, lastRect.yMax + 20), new Vector2(previewSize, previewSize));

			NoisePreview.DrawTexture(editedTexture, preview1, previewSize);
			NoisePreview.DrawTexture(grayscaleTexture, preview2, previewSize);

			GUILayout.Space(previewSize + 25f);
		}

		return base.DrawWizardGUI();
	}

	void Initialize (Object selectedObject)
	{
		selected = selectedObject;
		grayscaleTexture = (Texture2D)selectedObject;
		originalPath = AssetDatabase.GetAssetPath(selectedObject);

		width = grayscaleTexture.width;
		height = grayscaleTexture.height;

		editedTexture = new Texture2D (width, height);
		oldColors = grayscaleTexture.GetPixels();
	}

	public void ModifyTexture ()
	{
		Color[] newColors = new Color[width * height];

		for (int i = 0; i < newColors.Length; i++)
		{
			newColors[i] = ModifyPixel(oldColors[i]);
		}
		editedTexture.SetPixels(newColors);
		editedTexture.Apply();
	}

	Color ModifyPixel (Color originalColor)
	{
		float grayValue = (originalColor.r + originalColor.g + originalColor.b) / 3f;
		return gradient.gradient.Evaluate(grayValue);
	}
}