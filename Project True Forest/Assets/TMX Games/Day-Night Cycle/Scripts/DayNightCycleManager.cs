using UnityEngine;
using System.Collections;


[ExecuteInEditMode]
public class DayNightCycleManager : MonoBehaviour
{
	public static DayNightCycleManager Instance;

//	private Transform rotationContainer;
	

	public bool shouldRotate = true;
	public bool shouldUpdate = true;
	public float dayLength = 30f;
	public Vector3 rotationAxis;

	public GameObject sun;
	public GameObject moon;
	public Light sunLight;
	public Light moonLight;
	[HideInInspector]
	public Light dominantLight;

	public int daysInLunarCycle = 28;
	public int currentLunarCycleDay = 0;
	private Material moonBillboardMaterial;

	public GameObject moonBillboard;
	public float moonSize = 2f;
	public float moonBillboardDistance = 3000f;
	public bool debugUpdateMoonBillboard;

	public Gradient fogColors;
	public float maxFogDensity = .004f;

	public LightSettings sunLightSettings;
	public LightSettings moonLightSettings;

	//preserves the lighting reference to the sun object
	private bool editorWaitedOneFrame;
	
	[Header("----- Shown For Testing Purposes -----")]
	public float dayPercent;
	public Color currentFogColor;
	public float currentFogDensity;

	void Start ()
	{
		Initialize ();
		UpdateSettings();
	}

	void Initialize ()
	{
		if(Instance)
		{
			Destroy(gameObject);
		}
		Instance = this;

//		rotationContainer = transform.GetChild(0);

		if(moonBillboard)
		{
			UpdateMoonBillboard(true);
		}
	}

	void Update ()
	{
		//Set the instance in editor mode
		if(!Application.isPlaying && !Instance)
		{
			//HACK: preserves the procedural skybox's reference to the sun object since it's not exposed
			if(!editorWaitedOneFrame)
			{
				sun.SetActive(true);
				sunLight.intensity = 8f;
				editorWaitedOneFrame = true;
				return;
			}

			Initialize();
		}

		if(shouldRotate && Application.isPlaying)
		{
			transform.Rotate(rotationAxis, (360f / dayLength) * Time.deltaTime);
		}

		if(shouldUpdate || !Application.isPlaying)
		{
			UpdateSettings();
		}

		UpdateMoonBillboard(debugUpdateMoonBillboard);
	}

	void UpdateSettings()
	{
		dayPercent = Vector3.Dot(transform.forward, Vector3.up) * .5f + .5f;
		UpdateFog();
		UpdateLights();

		if(dayPercent > .5f)
		{
			Vector4 starRotation = Quaternion.LookRotation(moon.transform.up, transform.right).eulerAngles;
			
//			Vector4 starRotation = rotationContainer.rotation.eulerAngles;
//			if(starRotation.z > 0)
//			{
//				starRotation.x = 270f - (starRotation.x - 270f);
////				starRotation.y = transform.rotation.eulerAngles.y;
//			}
//			starRotation.x *= -1f;
			RenderSettings.skybox.SetVector("_StarRotation", starRotation);
		}
	}

	void UpdateFog()
	{
		currentFogColor = fogColors.Evaluate(dayPercent);
		currentFogDensity = maxFogDensity * currentFogColor.a;
		RenderSettings.fogDensity = currentFogDensity;
		RenderSettings.fogColor = currentFogColor;
	}

	void UpdateLights ()
	{
		sunLightSettings.UpdateSettings(dayPercent, sunLight);
		moonLightSettings.UpdateSettings(dayPercent, moonLight);

		dominantLight = (sunLight.intensity >= moonLight.intensity) ? sunLight : moonLight;


		ActiveCheck (sun, sunLight);
		ActiveCheck (moon, moonLight);
	}

	void ActiveCheck (GameObject checkObject, Light checkLight)
	{
		if(checkLight.intensity == 0f && checkObject.activeSelf)
		{
//			Debug.Log("Deactivating " + checkObject.name);
			checkObject.SetActive(false);
		}
		else if(checkLight.intensity > 0f && !checkObject.activeSelf)
		{
//			Debug.Log("Activating " + checkObject.name);
			checkObject.SetActive(true);
		}
	}

	void UpdateLunarCycle (int targetDay)
	{
		if(currentLunarCycleDay == targetDay)
			return;

		currentLunarCycleDay = targetDay % daysInLunarCycle;
		if(!moonBillboardMaterial)
		{
			moonBillboardMaterial = moonBillboard.GetComponent<Renderer>().material;
		}
		moonBillboardMaterial.SetFloat("_CyclePercent", (float)currentLunarCycleDay / (float)daysInLunarCycle);
	}

	void UpdateMoonBillboard (bool updateScale = false)
	{
		moonBillboard.transform.parent.position = Camera.main.transform.position + moon.transform.forward * -moonBillboardDistance;
		if(!updateScale)
			return;

		moonBillboard.transform.parent.localScale = Vector3.one * .05f * moonSize * moonBillboardDistance;
	}
}

[System.Serializable]
public struct LightSettings
{
	public Gradient lightColor;
	public float maxLightIntensity;
	public Color currentLightColor;
	public float currentLightIntensity;

	public void UpdateSettings (float dayPercent, Light light)
	{
		currentLightColor = lightColor.Evaluate(dayPercent);
		currentLightIntensity = currentLightColor.a * maxLightIntensity;
		light.color = currentLightColor;
		light.intensity = currentLightIntensity;
	}
}
