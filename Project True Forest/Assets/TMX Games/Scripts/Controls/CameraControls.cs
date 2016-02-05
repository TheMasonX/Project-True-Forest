using UnityEngine;
using System.Collections;

public class CameraControls : MonoBehaviour
{
	public float movementSpeed = 7.5f;
	public float movementSmoothing = .1f;
	public float superSpeedMultiplier = 3f;
	public float edgeClampDistance = 5f;
	private Vector2 mapSize;

	public float zoomSpeed = 5f;
	public float zoomSmoothing = .1f;
	public Vector2 zoomRange;

	public float mouseLookSpeed = 10f;
	public float mouseLookSmoothing = .1f;
	public float minMouseLookY = -70f;
	public float maxMouseLookY = 50f;
	private Vector2 mouseLook;

	private Transform childTransform;
	private bool mouseLookEnabled = false;
	private Vector2 cursorPosition;

	private float lastTime;
	private float deltaTime;

	void Start ()
	{
		childTransform = transform.GetChild(0);
		mouseLook.y = -childTransform.localRotation.eulerAngles.x;
		mapSize = new Vector2 (ForestController.Instance.mapSize.x / 2f - edgeClampDistance, ForestController.Instance.mapSize.z / 2f - edgeClampDistance);
	}
	

	void Update ()
	{
		deltaTime = Time.realtimeSinceStartup - lastTime;
		if (Input.GetMouseButtonDown(1) || Input.GetMouseButtonUp(1))
		{
			ToggleMouseLook();
		}

		if (mouseLookEnabled)
		{
			MouseLook();
		}
		GetInput();
		lastTime = Time.realtimeSinceStartup;
	}

	void GetInput()
	{
		Vector2 input = new Vector2 (Input.GetAxis("Horizontal"), Input.GetAxis("Vertical"));
		if (input.sqrMagnitude > 1f)
		{
			input.Normalize();
		}

		input *= deltaTime * 10f * movementSpeed;

		if (Input.GetButton("Super Speed"))
		{
			input *= superSpeedMultiplier;
		}

		Vector3 targetMovementPosition = transform.position + transform.right * input.x + transform.forward * input.y;
		targetMovementPosition = Vector3.Lerp(transform.position, targetMovementPosition, deltaTime / movementSmoothing);
		targetMovementPosition.x = Mathf.Clamp(targetMovementPosition.x, -mapSize.x, mapSize.x);
		targetMovementPosition.z = Mathf.Clamp(targetMovementPosition.z, -mapSize.y, mapSize.y);
//		transform.position = targetMovementPosition;

		float zoom = Input.mouseScrollDelta.y * -50f * deltaTime * zoomSpeed;
		Vector3 targetPosition = new Vector3(targetMovementPosition.x, Mathf.Clamp(targetMovementPosition.y + zoom, zoomRange.x, zoomRange.y), targetMovementPosition.z);
		transform.position = Vector3.Lerp(targetMovementPosition, targetPosition, deltaTime / zoomSmoothing);
	}

	void MouseLook ()
	{
		Vector2 lastMouseLook = mouseLook;
		mouseLook.x += Input.GetAxis("Mouse X") * deltaTime * 10f * mouseLookSpeed;
		mouseLook.y += Input.GetAxis("Mouse Y") * deltaTime * 10f * mouseLookSpeed;

		mouseLook.x = ClampAngle(mouseLook.x, -360f, 360f);
		mouseLook.y = ClampAngle(mouseLook.y, minMouseLookY, maxMouseLookY);
		transform.localRotation = Quaternion.Euler(0f, mouseLook.x, 0f);
		childTransform.localRotation = Quaternion.Euler(-mouseLook.y, 0f, 0f);
	}

	void ToggleMouseLook ()
	{
		mouseLookEnabled = !mouseLookEnabled;
		if (mouseLookEnabled)
		{
			Cursor.lockState = CursorLockMode.Locked;
			Cursor.visible = false;
		}
		else
		{
			Cursor.lockState = CursorLockMode.None;
			Cursor.visible = true;
		}
	}

	public static float ClampAngle (float angle, float min, float max)
	{
		angle = angle % 360;
		if ((angle >= -360F) && (angle <= 360F)) {
			if (angle < -360F) {
				angle += 360F;
			}
			if (angle > 360F) {
				angle -= 360F;
			}			
		}
		return Mathf.Clamp (angle, min, max);
	}
}
