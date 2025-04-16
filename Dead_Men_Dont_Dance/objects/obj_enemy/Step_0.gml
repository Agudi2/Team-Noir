if(state == "idle" || !instance_exists(obj_player)) {
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

if(state == "attack") {
	attack_timer--;
	image_angle_ = point_direction(x, y, obj_player.x, obj_player.y);
	if(attack_timer <= 0) {
		if(!distance_to_object(obj_player) < attack_range_break) {
			state = "check out";
			position_target_x = obj_player.x;
			position_target_y = obj_player.y;
		}
		attack_timer = attack_time;
		var shot_x = x;
		var shot_y = y;
		switch(weapon) {
			case "Pistol":
				attack_timer = obj_controller.shoot_timer_pistol;
				var shot = instance_create_layer(shot_x, shot_y, "Instances", obj_shot_enemy);
				shot.direction = image_angle_ + random_range(-obj_controller.spread_pistol, obj_controller.spread_pistol);
				shot.speed = obj_controller.shotspeed_pistol;
				shot.friction = obj_controller.friction_pistol;
				shot.damage = obj_controller.damage_pistol;
				shot.image_angle = image_angle_;
				break;
			case "Machine Gun":
				attack_timer = obj_controller.shoot_timer_machine_gun;
				var shot = instance_create_layer(shot_x, shot_y, "Instances", obj_shot_enemy);
				shot.direction = image_angle_ + random_range(-obj_controller.spread_machine_gun, obj_controller.spread_machine_gun);
				shot.speed = obj_controller.shotspeed_machine_gun;
				shot.friction = obj_controller.friction_machine_gun;
				shot.damage = obj_controller.damage_machine_gun;
				shot.image_angle = image_angle_;
				break;
			case "Shotgun":
				attack_timer = obj_controller.shoot_timer_shotgun;
				for (var i = 0; i < 5; i++) {
					var shot = instance_create_layer(shot_x, shot_y, "Instances", obj_shot_enemy);
					shot.direction = image_angle_ + random_range(-obj_controller.spread_shotgun, obj_controller.spread_machine_gun);
					shot.speed = obj_controller.shotspeed_shotgun;
					shot.friction = obj_controller.friction_shotgun;
					shot.damage = obj_controller.damage_shotgun;
					shot.image_angle = image_angle_;
				}
				break;
		}
	}
}