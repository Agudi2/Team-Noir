function screen_shake(magnitude, length) {
	if(magnitude > obj_camera.shake_remain) {
		if(obj_camera.shake) {
			obj_camera.shake_magnitude = magnitude;
			obj_camera.shake_remain = magnitude;
			obj_camera.shake_length = length;
		}
	}
}