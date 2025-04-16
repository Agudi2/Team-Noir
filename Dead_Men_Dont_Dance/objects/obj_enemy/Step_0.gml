if(state == "idle") {
	exit;
}

image_angle_ = lerp(image_angle_, direction, 0.1);

if(state == "check out") {
	event_user(0);
	state = "checking out";
	emote_index = 1;
}

if(state == "checking out") {
	if(distance_to_point(position_target_x, position_target_y) < 5) {
		state = "nothing here"
			emote_index = 2;
	}
}

if(state == "nothing here") {
	nothing_here_timer--;
	if(nothing_here_timer <= 0) {
		nothing_here_timer = nothing_here_time;
		event_user(1);
		state = "going back";
		emote_index = 1;
		player_sighted = 3;
	}
}

if(state == "going back") {
	if(distance_to_point(position_start_x, position_start_y) < 5) {
		state = "idle";
		emote_index = 0;
	}
}

/*switch(state) {
	case "idle":
		if(instance_exists(obj_player)) {
			if(point_distance(x, y, obj_player.x, obj_player.y) < sight_range) {
				var angle = point_direction(x, y, obj_player.x, obj_player.y)
				if(abs(angle_difference(angle, image_angle_)) < 30) {
					var line_wall = collision_line(x, y, x + lengthdir_x(sight_range, image_angle_), y + lengthdir_y(sight_range, image_angle_), obj_wall, 0, 0);
					if(line_wall == noone) {
						state = "attack"
					}
				}
			}
		}
		emote_index = 0;
		break;
	case "patrol":
		emote_index = 1;
		break;
	case "alert":
		emote_index = 2;
		break;
	case "attack":
		emote_index = 3;
		break;
}*/