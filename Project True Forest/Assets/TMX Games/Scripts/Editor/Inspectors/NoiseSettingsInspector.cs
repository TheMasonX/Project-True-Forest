using UnityEngine;
using UnityEditor;
using System.Collections;
using TMX.Utils;

[CustomEditor(typeof(NoiseSettings))]
public class NoiseSettingsInspector : Editor
{
	private bool displayPreview = true;
	public bool DisplayPreview
	{
		get
		{
			return displayPreview;
		}
		set
		{
			if (value)
			{
				GeneratePreview(target as NoiseSettings);
			}
			else
			{
				gridInitialized = false;
			}
			displayPreview = value;
		}
	}
	public bool gridInitialized;
	public int previewSize = 140;
	public float previewScale = 1.5f;
	public int previewSeed = 42;
	public float lastValueHash;

	public Rect previewWindowRect;

	public override void OnInspectorGUI ()
	{
		DrawDefaultInspector();

		var script = target as NoiseSettings;

		EditorGUILayout.Space();

		DisplayPreview = EditorGUILayout.Foldout(DisplayPreview, "Preview Noise Result");

		if (DisplayPreview)
		{
			if (!gridInitialized)
			{
				previewSeed = GetCurrentSeed();
				UpdateCheck(script);
				gridInitialized = true;
				EditorCoroutine.StartEditorCoroutine(CheckForUpdates(script));
			}

			var lastRect = GUILayoutUtility.GetLastRect();
			float previewPixelSize = (float)previewSize * previewScale;

			previewWindowRect = new Rect (new Vector2(lastRect.center.x - previewPixelSize / 2f, lastRect.yMin + 20), new Vector2(previewPixelSize, previewPixelSize));
			float previewOutputRange = 0f;
			if (script.passOperationType == NoiseSettings.PassOperation.ADD)
			{
				previewOutputRange = script.outputCurve.maxOutputValue - script.outputCurve.minOutputValue;
			}
			else if (script.passOperationType == NoiseSettings.PassOperation.MULTIPLY)
			{
				previewOutputRange = 1f;
			}

			NoisePreview.DrawNoise(script.debugPreviewGrid, previewWindowRect, previewOutputRange);
			GUILayout.Space(previewPixelSize + 5f);

			EditorGUI.indentLevel++;

			previewSeed = EditorGUILayout.IntField("Preview Seed: ", previewSeed);

			EditorGUILayout.BeginHorizontal();
			if (GUILayout.Button("Get Current Seed"))
			{
				previewSeed = GetCurrentSeed();
				GeneratePreview(script);
			}
			if (GUILayout.Button("Randomize Seed"))
			{
				previewSeed = CustomMathf.GetRandomSeed();
				GeneratePreview(script);
			}
			EditorGUILayout.EndHorizontal();

			EditorGUI.indentLevel--;
		}

		EditorGUILayout.Space();
		EditorGUILayout.Space();
		EditorGUILayout.Space();

		if (GUILayout.Button("--- Generate Terrain ---"))
		{
			GameObject.FindObjectOfType<TerrainGenerator>().GenerateMesh();
		}
	}

	public void GeneratePreview (NoiseSettings script)
	{
		script.debugPreviewGrid = new float[previewSize,previewSize];
		for (int x = 0; x < previewSize; x++)
		{
			for (int y = 0; y < previewSize; y++)
			{
				if (script.passOperationType == NoiseSettings.PassOperation.ADD)
				{
					script.debugPreviewGrid[x, y] = -script.outputCurve.minOutputValue;
				}
				else if (script.passOperationType == NoiseSettings.PassOperation.MULTIPLY)
				{
					script.debugPreviewGrid[x, y] = 1f;
				}
			}
		}
		script.ModifyGrid(ref script.debugPreviewGrid, 1f, previewSeed);
	}

	public int GetCurrentSeed ()
	{
		return GameObject.FindObjectOfType<TerrainGenerator>().proceduralTerrainSettings.seed;
	}

	public IEnumerator CheckForUpdates (NoiseSettings script)
	{
		while (Selection.activeObject == target || !DisplayPreview)
		{
			UpdateCheck(script);
			yield return 2f;
		}
	}

	public void UpdateCheck(NoiseSettings script)
	{
		float valueHash = GetPropertyValueHash(script);
		if (valueHash != lastValueHash)
		{
			lastValueHash = valueHash;
			GeneratePreview(script);
		}
	}

	//not sure how to best check for updates at the moment
	private float GetPropertyValueHash (NoiseSettings script)
	{
		float hash = (float)script.frequency * 1.1123f;
		hash += (float)script.lacunarity * 2.4123f;
		hash += (float)script.noisePassType * 1.53234f;
		hash += (float)script.octaves * 3.53434f;
		hash += (float)script.persistence * 2.1347f;
		hash += (float)script.quality * 4.1237f;
		if (script.turbulenceSettings.isActive)
		{
			hash += (float)script.turbulenceSettings.frequency * 5.2627f;
			hash += (float)script.turbulenceSettings.power * 2.68287f;
			hash += (float)script.turbulenceSettings.roughness * 1.682234f;
		}
		hash += (float)script.outputCurve.maxInputValue * 2.62347f;
		hash += (float)script.outputCurve.minInputValue * 5.62123f;
		hash += (float)script.outputCurve.curve.GetHashCode() * .0000052342f;

		return hash;
	}
}
