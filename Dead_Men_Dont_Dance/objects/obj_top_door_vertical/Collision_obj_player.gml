if(can_touch) {
	can_touch = false;
	var door_x = x + lengthdir_x(12, image_angle);
	var angle_normal = image_angle;
	while(angle_normal < 0) {
		angle_normal += 360;
	}
	if(other.x < door_x) {
		if(angle_normal >= 0 and angle_normal <= 90) {
			swing_speed = swing_speed_start;
		} else if(angle_normal > 90 and angle_normal <= 180) {
			swing_speed = -swing_speed_start;
		} else if(angle_normal > 180 and angle_normal <= 270) {
			swing_speed = -swing_speed_start;
		} else if(angle_normal > 270 and angle_normal < 360) {
			swing_speed = swing_speed_start;
		}
	}
	if(other.x > door_x) {
		if(angle_normal >= 0 and angle_normal <= 90) {
			swing_speed = -swing_speed_start;
		} else if(angle_normal > 90 and angle_normal <= 180) {
			swing_speed = swing_speed_start;
		} else if(angle_normal > 180 and angle_normal <= 270) {
			swing_speed = swing_speed_start;
		} else if(angle_normal > 270 and angle_normal < 360) {
			swing_speed = -swing_speed_start;
		}
	}
}