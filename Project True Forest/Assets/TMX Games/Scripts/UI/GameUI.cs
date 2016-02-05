using UnityEngine;
using UnityEngine.UI;
using System.Collections;
using TMX.Utils;

public class GameUI : MonoBehaviour
{
	public static GameUI Instance;
	float density;
	float densityScore;

	public Text treeCountText;
	public Text densityText;
	public Text densityScoreText;

	public Slider timeScaleSlider;
	public Text timeScaleText;

	void Awake ()
	{
		if (Instance)
		{
			Destroy(gameObject);
			return;
		}

		Instance = this;
	}
	
	public void UpdateScore (int treeCount, float newDensity, float newDensityScore)
	{
		treeCountText.text = treeCount.ToString();
		densityText.text = newDensity.ToString("P");
		densityScoreText.text = newDensityScore.ToString("F");
	}

	public void UpdateTimeScale (float timeScale)
	{
		timeScaleText.text = "Time Scale: " + timeScale.ToString("P");
		Time.timeScale = timeScale;
	}

	public void GenerateNewMap ()
	{
		LevelController.Instance.NewMap(CustomMathf.GetRandomSeed());
	}
}
