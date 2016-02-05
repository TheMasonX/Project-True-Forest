using UnityEngine;
using System.Collections;
using System.Collections.Generic;

public class ListRemoveTest : MonoBehaviour
{
	public List<int> testList;
	void Start ()
	{
		testList = new List<int>();
		for (int i = 0; i < 20; i++)
		{
			testList.Add(i);
		}
		testList.RemoveRange(0, 5);
	}
}
