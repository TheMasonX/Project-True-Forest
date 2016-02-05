using UnityEngine;
using System.Collections;
using TMX.Utils;

public static class DiamondSquare
{
	public static float[,] DiamondSquareGrid (int size, int seed, float rMin, float rMax, float noise, AnimationCurve smoothingCurve)
	{
		// Fail if grid size is not of the form (2 ^ n) - 1 or if min/max values are invalid
		int s = size - 1;
		if (!CheckIfPow2(s))
		{
			s = Mathf.ClosestPowerOfTwo(size);
			size = s + 1;
		}
		if(rMin >= rMax)
		{
			return null;
		}

		float modNoise = 0.0f;

		// init the grid
		float[,] grid = new float[size,size];

		Random.seed = seed;
		//		CustomMathf.NewGaussSeed(seed);

		// Seed the first four corners

		grid[0, 0] = GetRandomRange(smoothingCurve, rMin, rMax);
		grid[s, 0] = GetRandomRange(smoothingCurve, rMin, rMax);
		grid[0, s] = GetRandomRange(smoothingCurve, rMin, rMax);
		grid[s, s] = GetRandomRange(smoothingCurve, rMin, rMax);

		/*
			 * Use temporary named variables to simplify equations
			 * 
			 * s0 . d0. s1
			 *  . . . . . 
			 * d1 . cn. d2
			 *  . . . . . 
			 * s2 . d3. s3
			 * 
			 * */
		float s0, s1, s2, s3, d0, d1, d2, d3, cn;

		for (int i = s; i > 1; i /= 2)
		{
			// reduce the random range at each step
			modNoise = (rMax - rMin) * noise * ((float)i / s);

			// diamonds
			for (int y = 0; y < s; y += i)
			{
				for (int x = 0; x < s; x += i)
				{
					s0 = grid[x, y];
					s1 = grid[x + i, y];
					s2 = grid[x, y + i];
					s3 = grid[x + i, y + i];

					// cn
					grid[x + (i / 2), y + (i / 2)] = ((s0 + s1 + s2 + s3) / 4.0f) + GetRandomRange(smoothingCurve, -modNoise, modNoise);
				}
			}

			// squares
			for (int y = 0; y < s; y += i)
			{
				for (int x = 0; x < s; x += i)
				{
					s0 = grid[x, y];
					s1 = grid[x + i, y];
					s2 = grid[x, y + i];
					s3 = grid[x + i, y + i];
					cn = grid[x + (i / 2), y + (i / 2)];

					d0 = y <= 0 ? (s0 + s1 + cn) / 3.0f : (s0 + s1 + cn + grid[x + (i / 2), y - (i / 2)]) / 4.0f;
					d1 = x <= 0 ? (s0 + cn + s2) / 3.0f : (s0 + cn + s2 + grid[x - (i / 2), y + (i / 2)]) / 4.0f;
					d2 = x >= s - i ? (s1 + cn + s3) / 3.0f :
						(s1 + cn + s3 + grid[x + i + (i / 2), y + (i / 2)]) / 4.0f;
					d3 = y >= s - i ? (cn + s2 + s3) / 3.0f :
						(cn + s2 + s3 + grid[x + (i / 2), y + i + (i / 2)]) / 4.0f;

					grid[x + (i / 2), y] = d0 + GetRandomRange(smoothingCurve, -modNoise, modNoise);
					grid[x, y + (i / 2)] = d1 + GetRandomRange(smoothingCurve, -modNoise, modNoise);
					grid[x + i, y + (i / 2)] = d2 + GetRandomRange(smoothingCurve, -modNoise, modNoise);
					grid[x + (i / 2), y + i] = d3 + GetRandomRange(smoothingCurve, -modNoise, modNoise);
				}
			}
		}

		return grid;
	}

	private static bool CheckIfPow2(int a)
	{
		return (a & (a - 1)) == 0;
	}

	private static float GetRandomRange (AnimationCurve smoothingCurve, float min, float max)
	{
		return CustomMathf.RemapValue(smoothingCurve.Evaluate(Random.value), min, max, false);
	}

}
