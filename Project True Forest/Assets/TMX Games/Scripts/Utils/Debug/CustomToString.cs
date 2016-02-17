using UnityEngine;
using System.Collections;

namespace TMX.Utils
{
	public static class CustomToString
	{
		public static string V3 (Vector3 v3)
		{
			return "(" + v3.x.ToString() + ", " + v3.y.ToString() + ", " + v3.z.ToString() + ")";
		}
	}
}