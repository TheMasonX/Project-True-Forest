using UnityEngine;
using System.Collections;

public class TreeCutting : MonoBehaviour
{
	public float damageDealt = 10f;
	public float chopRate = .25f;
	private float lastChop = -Mathf.Infinity;
	public LayerMask layerMask;

	public AudioSource audioSource;
	public AudioClip[] clips;
	public Vector2 volumeRange;
	public Vector2 pitchRange;

	void Start ()
	{
	
	}
	
	void Update ()
	{
		if (Input.GetMouseButtonDown(0) && Time.time > lastChop + chopRate)
		{
			RaycastHit hit;
			if(Physics.Raycast(Camera.main.ScreenPointToRay(Input.mousePosition), out hit, 5000f, layerMask))
			{
				var foliageObject = hit.transform.GetComponentInParent<FoliageObject>();
				if(foliageObject)
				{
					PlayClipAtPosition(hit.point);
					foliageObject.ApplyDamage(damageDealt);
					lastChop = Time.time;
				}
			}
		}
	}

	void PlayClipAtPosition (Vector3 position)
	{
		audioSource.transform.position = position;
		audioSource.pitch = Random.Range(pitchRange.x, pitchRange.y);
		audioSource.PlayOneShot(clips[Random.Range(0, clips.Length)], Random.Range(volumeRange.x, volumeRange.y));
	}
}
