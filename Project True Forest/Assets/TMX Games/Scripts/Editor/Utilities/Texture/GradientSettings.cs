using UnityEngine;
using UnityEditor;
using System.Collections;
using TMX.Utils;

[CreateAssetMenu()]
public class GradientSettings : ScriptableObject
{
	public Gradient gradient;
	[HideInInspector] public Gradient lastGradient;
	[HideInInspector] public bool autoupdate;
	[HideInInspector] public float autoupdateRate = .5f;
	[HideInInspector] public long lastAutoUpdate;
	[HideInInspector] public string lastPath = "";
	[HideInInspector] public int textureSize = 512;
	[HideInInspector] public int textureSizePow = 9;
	[HideInInspector] public GradientTextureType textureType = GradientTextureType.HORIZONTAL;
}

[CustomEditor(typeof(GradientSettings))]
public class GradientSettingsInspector : Editor
{
	public override void OnInspectorGUI ()
	{
		var script = target as GradientSettings;

		DrawDefaultInspector();

		if (script.lastPath.Length > 0)
		{
			script.autoupdate = EditorGUILayout.Foldout(script.autoupdate, "Autoupdate Texture On Gradient Change");
		}
		else
		{
			script.autoupdate = false;
		}

		if (script.autoupdate)
		{
			script.autoupdateRate = EditorGUILayout.FloatField("Autoupdate Rate: ", script.autoupdateRate);

			EditorGUILayout.Space();

			long currentTime = System.DateTime.Now.Ticks;
			//convert the autoupdateRate from seconds to ticks (10,000,000 ticks in one second)
//			long updateIntervalInTicks = (long)(script.autoupdateRate * 10000000);
			long updateIntervalInTicks = CustomMathf.SecondsToTicks(script.autoupdateRate);
			if (script.lastAutoUpdate + updateIntervalInTicks < currentTime)
			{
				int checkPointCount = 6;
				for (int i = 0; i < checkPointCount; i++)
				{
					float checkPointPercent = (float)i / (float)(checkPointCount - 1);
					if ( script.lastGradient.Evaluate(checkPointPercent) != script.gradient.Evaluate(checkPointPercent))
					{
						CreateGradientTexture.SaveTexture(script.lastPath, script);
						script.lastAutoUpdate = currentTime;
						break;
					}
				}
			}
		}

		EditorGUILayout.Space();

		script.textureSizePow = EditorGUILayout.IntSlider("Texture Size: " + script.textureSize.ToString() + " px", script.textureSizePow, 1, 11);
		script.textureSize = (int)Mathf.Pow(2, script.textureSizePow);

		EditorGUILayout.Space();


		if (GUILayout.Button("Save As Texture"))
		{
			CreateGradientTexture.CreateWizard();
		}
	}
}