using UnityEngine;
using System.Collections;
using System.Threading;
using System.Collections.Generic;
using System;
using LibNoise.Unity.Operator;

public class ThreadedScaleUpdater : MonoBehaviour
{
	public static ThreadedScaleUpdater Instance;
	private ScaleUpdateWorker workerThreadClass;
	public float updateInterval = 2f;
	public List<FoliageInfo> objectsToUpdate;
	//getting the list.Count is somewhat high up on the profiler, so we'll set it manually
	private int objectCount = 0;

	void Awake ()
	{
		if (Instance)
		{
			Destroy(this);
			return;
		}

		Instance = this;
		objectsToUpdate = new List<FoliageInfo>();
		workerThreadClass = new ScaleUpdateWorker (updateInterval, Time.time);
	}

	public void Update ()
	{
		workerThreadClass.UpdateTime(Time.time);
		if (objectCount > 0)
		{
			for (int i = 0; i < objectCount; i++)
			{
				objectsToUpdate[i].foliageObject.UpdateScale(objectsToUpdate[i].currentScale);
			}
			objectsToUpdate.Clear();
			objectCount = 0;
		}
	}

	public void UpdateScaleCallback (FoliageInfo info)
	{
		objectsToUpdate.Add(info);
		objectCount++;
	}

	public void AddFoliageObject (FoliageObject newObject)
	{
		if (newObject.selfTerrainObjectType.dna.grows)
		{
			workerThreadClass.AddObject(new FoliageInfo (newObject, Time.time));
		}
	}

	public void RemoveObject (FoliageInfo oldObject)
	{
		workerThreadClass.RemoveObject(oldObject);
	}

	public void RemoveAll ()
	{
		workerThreadClass.RemoveAll();
	}
}

public class ScaleUpdateWorker
{
	public static List<FoliageInfo> foliageObjects;
	public static bool isActive;
	private float lastUpdate;
	private Thread workerThread;
	private static int updateInterval;
	public static float currentTime;

	public ScaleUpdateWorker (float _updateInterval, float newCurrentTime)
	{
		isActive = true;
		foliageObjects = new List<FoliageInfo>();
		currentTime = newCurrentTime;
		updateInterval = Mathf.RoundToInt(_updateInterval * 1000);
		workerThread = new Thread (UpdateScales);
		workerThread.Start();
	}

	public void AddObject (FoliageInfo newObject)
	{
		foliageObjects.Add(newObject);
	}

	public void RemoveObject (FoliageInfo oldObject)
	{
		foliageObjects.Remove(oldObject);
	}

	public void RemoveAll ()
	{
		foliageObjects.Clear();
	}

	public void UpdateTime (float newCurrentTime)
	{
		currentTime = newCurrentTime;
	}

	public void UpdateScales ()
	{
		while (isActive)
		{
			if (foliageObjects.Count > 0)
			{
				for (int i = 0; i < foliageObjects.Count; i++)
				{
					foliageObjects[i].UpdateScale(currentTime);
				}
			}
			Thread.Sleep(updateInterval);
		}
	}
}

public class FoliageInfo
{
	public delegate void UpdateScaleCallback (FoliageInfo scaleInfo);
	public UpdateScaleCallback callback;

	public delegate void DestroyedCallback (FoliageInfo thisInfo);
	public DestroyedCallback destroyedCallback;

	public FoliageObject foliageObject;
	private float updateScalePercent;
	private float lastScale;
	public float currentScale;

	public FoliageInfo (FoliageObject newFoliageObject, float currentTime)
	{
		foliageObject = newFoliageObject;
		callback = ThreadedScaleUpdater.Instance.UpdateScaleCallback;
		destroyedCallback = ThreadedScaleUpdater.Instance.RemoveObject;
		updateScalePercent = foliageObject.selfTerrainObjectType.dna.scaleDifferenceUpdatePercent;

		//prevent the scale from smooth updating at the start, as it'll already be set
		currentScale = foliageObject.GetAgedScaleFloat(currentTime);
		lastScale = currentScale;
	}

	public void UpdateScale (float currentTime)
	{
		if (foliageObject == null)
		{
			destroyedCallback(this);
			return;
		}

		currentScale = foliageObject.GetAgedScaleFloat(currentTime);
		if ((currentScale / lastScale - 1f) > updateScalePercent)
		{
			callback(this);
			lastScale = currentScale;
		}
	}
}