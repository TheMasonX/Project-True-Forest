using UnityEngine;
using System.Collections;
using TMX.Utils;

namespace TMX.Utils
{
	public enum ColorChannel
	{
		RED = 0,
		GREEN = 1,
		BLUE = 2,
		ALPHA = 3
	};

	public static class ColorUtils
	{
		public static Color AffectColorChannel (ColorChannel channel, Color originalColor, float value)
		{
			switch (channel)
			{
			case ColorChannel.RED:
				originalColor.r = value;
				break;
			case ColorChannel.GREEN:
				originalColor.g = value;
				break;
			case ColorChannel.BLUE:
				originalColor.b = value;
				break;
			case ColorChannel.ALPHA:
				originalColor.a = value;
				break;
			}
			return originalColor;
		}
	}
}