using UnityEngine;
using UnityEngine.UI;
using System.Collections;

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
//		float timeScale = timeScaleSlider.value;
		timeScaleText.text = "Time Scale: " + timeScale.ToString("F");
		Time.timeScale = timeScale;
	}
}
