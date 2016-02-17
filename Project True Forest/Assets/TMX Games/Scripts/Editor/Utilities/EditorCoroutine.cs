using System;
using System.Collections;
using System.Collections.Generic;
using UnityEditor;
using UnityEngine;
using Object = UnityEngine.Object;

public class EditorCoroutine
{
	public static EditorCoroutine StartEditorCoroutine( IEnumerator _routine )
	{
		EditorCoroutine coroutine = new EditorCoroutine(_routine);
		coroutine.StartEditorCoroutine();
		return coroutine;
	}

	readonly IEnumerator routine;
	EditorCoroutine( IEnumerator _routine )
	{
		routine = _routine;
	}

	void StartEditorCoroutine()
	{
		//Debug.Log("start");
		EditorApplication.update += update;
	}
	public void stop()
	{
		//Debug.Log("stop");
		EditorApplication.update -= update;
	}

	void update()
	{
		/* NOTE: no need to try/catch MoveNext,
		 * if an IEnumerator throws its next iteration returns false.
		 * Also, Unity probably catches when calling EditorApplication.update.
		 */

		//Debug.Log("update");
		if (!routine.MoveNext())
		{
			stop();
		}
	}
}
