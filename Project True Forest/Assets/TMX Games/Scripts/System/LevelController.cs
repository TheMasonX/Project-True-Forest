using UnityEngine;
using System.Collections;
using TMX.Utils;

public class LevelController : MonoBehaviour
{
	public static LevelController Instance;
	public int seed;
	public bool useSeed;

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
		TerrainGenerator.Instance.GenerateMesh();
		Invoke("CreateMap2", 0f);
	}

	private void CreateMap2 ()
	{
		ForestController.Instance.Respawn();
		FireController.Instance.InitializeFireGrid();
	}
}
