using UnityEngine;
using System.Collections;
using System.Collections.Generic;
using SharpNeat.Utility;

namespace TMX.Utils
{
	public static class CustomMathf
	{
		public static float sqrt2 = 1.4142135623730950488f;
		public static ZigguratGaussianSampler gaussianSampler;
		public static bool gaussianSamplerInitialized = false;

		public static float MilesPerHourToMetersPerSecond (float value)
		{
			return value * 0.44704f;
		}

		public static float MetersPerSecondToMilesPerHour (float value)
		{
			return value * 2.23693629f;	
		}

		public static bool HaveTheSameSign (float a, float b)
		{
			return (Mathf.Sign(a) == Mathf.Sign(b));
		}

		// simple function to add a curved bias towards 1 for a value in the 0-1 range
		public static float CurveFactor(float factor)
		{
			return 1 - (1 - factor)*(1 - factor);
		}

		// unclamped version of Lerp, to allow value to exceed the from-to range
		public static float ULerp(float from, float to, float value)
		{
			return (1.0f - value)*from + value*to;
		}
			
		public static float Hermite (float value)
		{
			return value * value * (3f - 2f * value);
		}

		public static float Hermite (float value, float from, float to)
		{
			return Mathf.Lerp(from, to, value * value * (3f - 2f * value));
		}

		public static Vector3 GetBezierPoint (Vector3 start, Vector3 middle, Vector3 end, float t)
		{
			//Clamp when calling if needed, rather than do it when it's usually unneccesary
//			t = Mathf.Clamp01(t);
			float oneMinusT = 1f - t;
			return oneMinusT * oneMinusT * start + 2f * oneMinusT * t * middle + t * t * end;
//			return Vector3.Lerp(Vector3.Lerp(start, middle, t), Vector3.Lerp(middle, end, t), t);
		}

		public static Vector3 GetBezierDerivative (Vector3 start, Vector3 middle, Vector3 end, float t)
		{
			return 2f * (1f - t) * (middle - start) + 2f * t * (end - middle);
		}

		public static Vector3 NearestPoint(Vector3 lineStart, Vector3 lineEnd, Vector3 point)
		{
			Vector3 lineDirection = Vector3.Normalize(lineEnd-lineStart);
			float closestPoint = Vector3.Dot((point-lineStart),lineDirection)/1f;
			return lineStart+(closestPoint*lineDirection);
		}

		public static float NearestPointPercentage(Vector3 lineStart, Vector3 lineEnd, Vector3 point)
		{
			Vector3 fullDirection = lineEnd-lineStart;
			float lineDistance = fullDirection.magnitude;
			Vector3 lineDirection = Vector3.Normalize(fullDirection);
			float closestPoint = Vector3.Dot((point-lineStart),lineDirection)/1f;
//			float closestPoint = Vector3.Dot((point-lineStart),lineDirection)/Vector3.Dot(lineDirection,lineDirection);  ------ Dot(x,x) ALWAYS = 1

			//the unclampped percent
			return closestPoint / lineDistance;
		}

		#region Remap Overflows
		public static float RemapValueDouble (float input, Vector2 inputRange, Vector2 outputRange, bool clamped = true)
		{
			return RemapValueDouble(input, inputRange.x, inputRange.y, outputRange.x, outputRange.y, clamped);
		}

		public static float RemapValueDouble (float input, float inputMin, float inputMax, float outputMin, float outputMax, bool clamped = true)
		{
			return RemapValue(RemapValue(input, inputMin, inputMax, clamped), outputMin, outputMax, clamped);
		}

		public static float RemapValue (float input, Vector2 range, bool clamped = true)
		{
			return RemapValue(input, range.x, range.y, clamped);
		}

		public static float RemapValue (float input, float min, float max, bool clamped = true)
		{
			input = min + (input * (max - min));
			return (clamped ? Mathf.Clamp(input, min, max) : input);
		}
		#endregion

		public static int GetRandomSeed ()
		{
			return System.DateTime.Now.Millisecond;
		}

		private static System.Random rng = new System.Random();  

		public static void Shuffle<T>(this IList<T> list)  
		{  
			int n = list.Count;  
			while (n > 1) {  
				n--;  
				int k = rng.Next(n + 1);  
				T value = list[k];  
				list[k] = list[n];  
				list[n] = value;  
			}  
		}

		public static float GetSlopeAtPoint (ref Vector3 point, LayerMask layerMask, float rayDistance)
		{
			RaycastHit hit;
			if (Physics.Raycast(point + Vector3.up * 5f, Vector3.down, out hit, rayDistance, layerMask))
			{
				point = hit.point;
				return Vector3.Angle(hit.normal, Vector3.up);
			}
			else
			{
				return 180f;
			}
		}

		public static void NewGaussSeed ()
		{
			NewGaussSeed(System.DateTime.Now.Millisecond);
		}

		public static void NewGaussSeed (int seed)
		{
			gaussianSampler = new ZigguratGaussianSampler (seed);
			gaussianSamplerInitialized = true;
		}

		public static float GaussRandom ()
		{
			if (!gaussianSamplerInitialized)
			{
				NewGaussSeed();
			}
			return (float)gaussianSampler.NextSample();
		}

		public static float GaussRandomRange (float min, float max)
		{
			return RemapValue(GaussRandom(), min, max, true);
		}

		public static float GetMean (float[] values)
		{
			float total = 0f;
			for (int i = 0; i < values.Length; i++)
			{
				total += values[i];
			}
			return total / values.Length;
		}
	}

	[System.Serializable]
	public struct Vector2Int
	{
		public int x;
		public int y;

		public Vector2Int (int newX, int newY)
		{
			this.x = newX;
			this.y = newY;
		}

		public Vector2Int (Vector2 v2)
		{
			this.x = (int)v2.x;
			this.y = (int)v2.y;
		}

		public static Vector2Int ToInt (Vector2 floatV2)
		{
			return new Vector2Int ((int)floatV2.x, (int)floatV2.y);
		}

		public static Vector2Int operator + (Vector2Int a, Vector2Int b)
		{
			a.x += b.x;
			a.y += b.y;
			return a;
		}

		public static Vector2Int operator - (Vector2Int a, Vector2Int b)
		{
			a.x -= b.x;
			a.y -= b.y;
			return a;
		}

		#region Mixed Vector2/Vector2Int operators
		public static Vector2 operator - (Vector2 a, Vector2Int b)
		{
			a.x -= b.x;
			a.y -= b.y;
			return a;
		}

		public static Vector2 operator - (Vector2Int a, Vector2 b)
		{
			return new Vector2((float)a.x - b.y, (float)a.y - b.y);
		}

		public static Vector2 operator + (Vector2 a, Vector2Int b)
		{
			a.x += b.x;
			a.y += b.y;
			return a;
		}

		public static Vector2 operator + (Vector2Int a, Vector2 b)
		{
			return new Vector2((float)a.x + b.y, (float)a.y + b.y);
		}
		#endregion
	}
}