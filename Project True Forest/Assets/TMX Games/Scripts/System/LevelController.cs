using UnityEngine;
using System.Collections;
using TMX.Utils;
using System;

public class LevelController : MonoBehaviour
{
	public static LevelController Instance;
	public Calendar calendar;
	public Vector3 mapSize;
	public int seed;
	public bool useSeed;
	public float yearLength
	{
		get { return calendar.yearLength; }
	}

	public void Awake ()
	{
		if (Instance)
		{
			Destroy(gameObject);
			return;
		}

		Instance = this;

		if (!useSeed)
		{
			seed = CustomMathf.GetRandomSeed();
		}

		CreateMap();
	}

	public void NewMap (int newSeed)
	{
		seed = newSeed;
		CreateMap();
	}

	public void CreateMap ()
	{
		calendar.Reset();
		ForestController.Instance.mapSize = mapSize;
		TerrainGenerator.Instance.GenerateMesh();
		Invoke("CreateMap2", 0f);
	}

	private void CreateMap2 ()
	{
		ForestController.Instance.Respawn();
		FireController.Instance.InitializeFireGrid();
	}
}

[Serializable]
public class Calendar
{
	private float yearStart;
	public int currentYear;
	public float yearLength;
	public float timeOfYear
	{
		get
		{
			var time = (Time.time - yearStart) / yearLength;
			if (time >= 1f)
			{
				currentYear++;
				yearStart = Time.time;
				time -= 1f;
			}
			return time;
		}
	}
	public static int[] daysPerMonth = { 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 };
	public Vector2Int currentDate
	{
		get
		{
			int dayOfTheYear = Mathf.FloorToInt(timeOfYear * 365);
			for (int i = 0; i < 12; i++)
			{
				if (dayOfTheYear < daysPerMonth[i])
				{
					return new Vector2Int(i + 1, dayOfTheYear + 1);
				}
				dayOfTheYear -= daysPerMonth[i];
			}
			return new Vector2Int (42, 42);
		}
	}
	public static string[] monthNames = { "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December" };
	public static string[] monthAbbreviations = { "Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sept", "Oct", "Nov", "Dec" };
	public string GetFormatedDate (bool abbreviate)
	{
		Vector2Int date = currentDate;
		return String.Format("{0} {1}", (abbreviate ? monthAbbreviations[date.x - 1] : monthNames[date.x - 1]), date.y);
	}

	public void Reset ()
	{
		yearStart = Time.time;
	}
}