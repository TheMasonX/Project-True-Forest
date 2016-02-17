using UnityEngine;
using System.Collections;
using UnityEngine.UI;
using TMX.Utils;
using System;

public class WeatherUIPanel : MonoBehaviour
{
	public CalendarBox dateReadoutSettings;
	public TemperatureBox temperatureReadoutSettings;
	public float tickInterval = 1f;
	void OnEnable ()
	{
		InvokeRepeating("UITick", 0f, tickInterval);
	}

	void UITick ()
	{
		dateReadoutSettings.UpdateDisplay();
		temperatureReadoutSettings.UpdateDisplay();
	}
}

[Serializable]
public class CalendarBox
{
//	public Image background;
	public Text dateReadout;
	public bool useAbbreviatedMonthNames = true;

	public void UpdateDisplay ()
	{
		dateReadout.text = LevelController.Instance.calendar.GetFormatedDate(useAbbreviatedMonthNames);
	}
}

[Serializable]
public class TemperatureBox
{
	public Image background;
	public Text temperatureReadout;
	public ScaledGradient backgroundColorFromTemperature;
	private float temperature;

	public void UpdateDisplay ()
	{
		temperature = DayNightCycleManager.Instance.weatherController.temperatureSettings.GetTemperature();
		background.color = backgroundColorFromTemperature.GetColor(temperature);
		temperatureReadout.text = String.Format("{0}°F", temperature.ToString("###"));
	}
}
