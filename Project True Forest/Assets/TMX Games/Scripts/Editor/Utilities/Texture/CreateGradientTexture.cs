using UnityEngine;
using System.Collections;
using UnityEditor;
using System.IO;

public enum GradientTextureType
{
	HORIZONTAL = 0,
	VERTICAL = 1
}

public class CreateGradientTexture : ScriptableWizard
{
	public GradientSettings gradientSettings;
	public GradientTextureType textureType;

	[MenuItem("TMX/Textures/Create Gradient Texture")]
	public static void CreateWizard ()
	{
		ScriptableWizard.DisplayWizard<CreateGradientTexture>("Create Gradient Texture");

		if (Selection.activeObject.GetType() == typeof(GradientSettings))
		{
			(EditorWindow.GetWindow(typeof(CreateGradientTexture)) as CreateGradientTexture).gradientSettings = Selection.activeObject as GradientSettings;
		}
	}

	private void OnWizardCreate ()
	{
		string extension = "png";
		string lastPath = "Assets/";
		if (gradientSettings.lastPath.Length > 0)
		{
			lastPath = gradientSettings.lastPath;
		}

		string path = EditorUtility.SaveFilePanel("Save Gradient Texture",
			lastPath,
			gradientSettings.name,
			extension);

		if (path.Length > 0)
		{
			gradientSettings.lastPath = path;
			gradientSettings.textureType = textureType;
			SaveTexture(path, gradientSettings);
		}
	}

	public static void SaveTexture (string path, GradientSettings gradient)
	{
		var encodedMap = GenerateTexture(gradient).EncodeToPNG();
		gradient.lastGradient = new Gradient ();
		gradient.lastGradient.alphaKeys = gradient.gradient.alphaKeys;
		gradient.lastGradient.colorKeys = gradient.gradient.colorKeys;
		File.WriteAllBytes(path, encodedMap);
		var savedGradient = AssetDatabase.LoadAssetAtPath<Texture2D>(path);
		savedGradient.wrapMode = TextureWrapMode.Clamp;
		AssetDatabase.Refresh();
		AssetDatabase.SaveAssets();
	}

	public static Texture2D GenerateTexture (GradientSettings gradient)
	{
		int textureSize = gradient.textureSize;
		Texture2D outputTexture = new Texture2D ((gradient.textureType == GradientTextureType.HORIZONTAL) ? textureSize : 1, (gradient.textureType == GradientTextureType.VERTICAL) ? textureSize : 1);
		Color[] colors = new Color[textureSize];

		for (int i = 0; i < textureSize; i++)
		{
			float gradientPercent = (float)i / (float)(textureSize - 1);
			colors[i] = gradient.gradient.Evaluate(gradientPercent);
		}

		outputTexture.SetPixels(colors);
		outputTexture.Apply();
		outputTexture.wrapMode = TextureWrapMode.Clamp;
		return outputTexture;
	}
}