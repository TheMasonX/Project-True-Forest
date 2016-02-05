using UnityEngine;
using System.Collections;

namespace TMX.Utils
{
	public static class MiscUtils
	{
		public static void DeleteChildren (Transform parent)
		{
			if (parent.childCount > 0)
			{
				for (int i = 0; i < parent.childCount; i++)
				{
					if (Application.isPlaying)
						GameObject.Destroy(parent.GetChild(i).gameObject);
					else
						GameObject.DestroyImmediate(parent.GetChild(i).gameObject);
				}
			}
		}

		public static void DebugRealTime (ref float lastTime, string message)
		{
			Debug.Log((Time.realtimeSinceStartup - lastTime).ToString("F1") + message);
			lastTime = Time.realtimeSinceStartup;
		}

		public static void ResetTexture (ref Texture2D tex, ref Color[] colors, Color newColor)
		{
			for (int i = 0; i < colors.Length; i++)
			{
				colors[i] = newColor;
			}
			tex.SetPixels(colors);
			tex.Apply();
		}
	}
}
