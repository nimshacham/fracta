using UnityEngine;
using System.Collections;

public class wasd_texture_scroll : MonoBehaviour {

	public float movespeed = 0.5f;
	private Rigidbody2D rigidbody;

	void Awake () {
		rigidbody = GetComponent<Rigidbody2D> ();
	}

	// Use this for initialization
	void Start () {

	}

	// Update is called once per frame
	void Update () {
		float cameraVar	= zoom_camera.camera_scale;
		float inner_speed = movespeed * cameraVar;
		if (Input.GetKey("a"))
			rigidbody.MovePosition(rigidbody.position + new Vector2 (+inner_speed, 0.0f));
		if (Input.GetKey("d"))
			rigidbody.MovePosition(rigidbody.position + new Vector2 (-inner_speed, 0.0f));
		if (Input.GetKey("w"))
			rigidbody.MovePosition(rigidbody.position + new Vector2 (0.0f,-inner_speed));
		if (Input.GetKey("s"))
			rigidbody.MovePosition(rigidbody.position + new Vector2 (0.0f,+inner_speed));
	}
}
