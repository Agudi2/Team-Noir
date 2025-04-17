if(abs(swing_speed) > 0) {
	image_angle += swing_speed;
	image_angle %= 360;
	if(image_angle < -120) {
		image_angle = -120;
		swing_speed = abs(swing_speed);
	}
	if(image_angle > 120) {
		image_angle = 120;
		swing_speed = -abs(swing_speed);
	}
	if(swing_speed > 0.2) {
		swing_speed -= 0.2
	} else if (swing_speed < -0.2) {
		swing_speed += 0.2
	} else {
		swing_speed = 0;
	}
}

if(swing_speed = 0) {
	can_touch = true;
}