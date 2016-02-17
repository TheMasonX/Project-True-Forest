using UnityEngine;
using System.Collections;

[ExecuteInEditMode]
public class BillboardObject : MonoBehaviour
{
	public bool onlySetAtStart = false;

	void Start ()
	{
		FaceCamera();
	}

	void Update ()
	{
		if(onlySetAtStart)
			return;

		FaceCamera();
	}

	void FaceCamera ()
	{
		transform.LookAt(Camera.main.transform.position, Vector3.up);
	}
}
