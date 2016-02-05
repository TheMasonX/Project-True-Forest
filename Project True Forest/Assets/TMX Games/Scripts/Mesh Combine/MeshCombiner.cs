using UnityEngine;
using System.Collections;
using System.Collections.Generic;

public class MeshCombiner : MonoBehaviour
{
	public static MeshCombiner Instance;
	public List<CombinedContainer> combinedContainers;

	public void Awake ()
	{
		if (Instance)
		{
			Destroy(gameObject);
			return;
		}

		Instance = this;
	}

	public void CombineObjects (List<CombinedObject> objectsYetToCombine)
	{
		combinedContainers = new List<CombinedContainer>();
		while (objectsYetToCombine.Count > 0)
		{
			GameObject newContainer = new GameObject ("Combined Mesh Container " + combinedContainers.Count);
			newContainer.transform.parent = transform;
			newContainer.AddComponent<CombinedContainer>();
			newContainer.GetComponent<CombinedContainer>().CombineObjects(ref objectsYetToCombine);

			combinedContainers.Add(newContainer.GetComponent<CombinedContainer>());
		}
	}
}
