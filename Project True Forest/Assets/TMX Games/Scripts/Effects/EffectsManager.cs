using UnityEngine;
using System.Collections;

public class EffectsManager : MonoBehaviour
{
	public static EffectsManager Instance;
	public bool displayFireLights;

	void Awake ()
	{
		if (Instance)
		{
			Destroy(gameObject);
			return;
		}
		Instance = this;
	}
}
