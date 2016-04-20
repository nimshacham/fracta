using UnityEngine;
using System.Collections;

public class zoom_camera : MonoBehaviour {

	public float zoomspeed = 0.5f;
	public static float camera_scale;

	private Camera camera;
	//public float camera_size;
	void Awake () {
		camera = GetComponent<Camera> ();
	}

	// Use this for initialization
	void Start () {

	}

	// Update is called once per frame
	void Update () {
		camera_scale = camera.orthographicSize;
		if (Input.GetKey ("p"))
			camera.orthographicSize += (zoomspeed*camera.orthographicSize);
		if (Input.GetKey ("o"))
			camera.orthographicSize -= (zoomspeed*camera.orthographicSize);
	}
}
