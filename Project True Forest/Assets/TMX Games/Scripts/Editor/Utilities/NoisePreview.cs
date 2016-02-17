using UnityEngine;
using UnityEditor;
using NUnit.Framework;

public static class NoisePreview
{
	public static void DrawNoise (float[,] grid, Rect previewArea, float range)
	{
		int width = grid.GetLength(0);
		int height = grid.GetLength(1);

		Vector2 blockSize = new Vector2 (previewArea.width / (float)(width), previewArea.height / (float)(height));

		for (int x = 0; x < width; x++)
		{
			for (int y = 0; y < height; y++)
			{
				float value = grid[x, y] / range;
				Rect blockRect = new Rect (previewArea.x + blockSize.x * x, previewArea.y + blockSize.y * y, blockSize.x, blockSize.y);
				EditorGUI.DrawRect(blockRect, new Color(value,value,value,1));
			}
		}
	}

	public static void DrawTexture (Texture2D texture, Rect previewArea, float textureSize, bool useAlpha = false)
	{
		int width = (int)textureSize;
		int height = (int)textureSize;

		Vector2 blockSize = new Vector2 (previewArea.width / (float)(width), previewArea.height / (float)(height));

		for (int x = 0; x < width; x++)
		{
			for (int y = 0; y < height; y++)
			{
				float horizontalPercent = (float)x / (textureSize - 1f);
				float verticalPercent = (float)y / (textureSize - 1f);

				Rect blockRect = new Rect (previewArea.x + blockSize.x * x, previewArea.y + blockSize.y * y, blockSize.x, blockSize.y);
				Color blockColor = texture.GetPixelBilinear(horizontalPercent, verticalPercent);
				if (!useAlpha)
				{
					blockColor.a = 1f;
				}
				EditorGUI.DrawRect(blockRect, blockColor);
			}
		}
	}
}
