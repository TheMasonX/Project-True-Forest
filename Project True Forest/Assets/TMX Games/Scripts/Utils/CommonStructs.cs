using UnityEngine;
using System.Collections;
using TMX.Utils;

namespace TMX.Utils
{
//	public class CommonStructs
//	{
//
//	}

	[System.Serializable]
	public class Curve
	{
//		public string curveName = "Animation Curve";
		public AnimationCurve curve;
		public float minInputValue = 0;
		public float maxInputValue = 1;
		public float minOutputValue = 0;
		public float maxOutputValue = 1;

		public Curve ()
		{
			curve = new AnimationCurve ();
			curve.AddKey(0f,0f);
			curve.AddKey(1f,1f);
		}

		public virtual float GetValue (float inputValue)
		{
			inputValue = Mathf.Clamp(inputValue, minInputValue, maxInputValue);
			inputValue = (inputValue - minInputValue) / (maxInputValue - minInputValue);

			return CustomMathf.RemapValue(curve.Evaluate(inputValue), minOutputValue, maxOutputValue, true);
		}

		public override string ToString ()
		{
			return ("Min/Max Input: [" + minInputValue.ToString("F1") + "," + maxInputValue.ToString("F1") + "] ||| Min/Max Output: [" + minOutputValue.ToString("F1") + "," + maxOutputValue.ToString("F1") + "]");
		}
	}

	[System.Serializable]
	public class SmoothCurve : Curve
	{
		public float smoothingValue = .1f;
		public float currentValue;
		private bool initialized;

		public override float GetValue (float inputValue)
		{
			return GetSmoothValue(inputValue, Time.deltaTime);
		}

		public float GetSmoothValue (float inputValue, float timePeriod)
		{
			float lastValue = currentValue;
			currentValue = base.GetValue(inputValue);

			//needed to avoid lerping the initial value from zero in case the value is outside the smoothing range
			if (!initialized)
			{
				initialized = true;
				return currentValue;
			}

			if (smoothingValue > 0f)
			{
				currentValue = Mathf.Lerp(lastValue, currentValue, timePeriod / smoothingValue);
			}

			return currentValue;
		}
	}

	[System.Serializable]
	public class PerlinNoise
	{
		public float frequency = 1f;
		public Curve outputRange;
		[HideInInspector] public int seed;

		public void Initialize (int newSeed)
		{
			seed = newSeed;
		}

		public float GetValue (Vector3 position)
		{
			return GetValue(position.x + position.z, position.y);
		}

		public float GetValue (Vector2 position)
		{
			return GetValue(position.x, position.y);
		}

		public float GetValue (float x, float y)
		{
			return outputRange.GetValue(Mathf.PerlinNoise(x * frequency + seed, y * frequency + seed));
		}
	}

	[System.Serializable]
	public class AnimatedPerlinNoise : PerlinNoise
	{
		public float animationSpeed = .1f;

		private float samplePoint;
		private float currentValue;

		public float AnimateValue (float timeInterval)
		{
			samplePoint += animationSpeed * timeInterval * frequency;
			currentValue = outputRange.GetValue(Mathf.PerlinNoise(samplePoint, seed));
			return currentValue;
		}

		public float GetAnimatedValue ()
		{
			return currentValue;
		}
	}
}