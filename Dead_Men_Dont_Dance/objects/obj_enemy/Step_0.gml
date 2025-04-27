image_angle_ -= angle_difference(image_angle_, direction) * 0.1

recoil_timer = max(0, recoil_timer - 1);
if (recoil_timer == 0 && weapon != "None") {
	image_index = 0;
}

if (x-xprev == 0 and y-yprev == 0) {
	feet_image_index = 0;
	image_speed = 0;
	if(weapon_sprite == spr_empty) {
		image_index = 0;
	}
	walk_timer = 0;
} else {
	feet_image_index += feet_image_speed;
	if(weapon_sprite == spr_empty) {
		image_speed = 1;
	}
	walk_timer += 1;
}

xprev = x;
yprev = y;

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
		player_sighted = 1;
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
	if(instance_exists(obj_player)) {
		image_angle_ = point_direction(x, y, obj_player.x, obj_player.y);
	} else {
		state = "nothing here";
		exit;
	}
	if(attack_timer <= 0) {
		if (collision_line(x, y, obj_player.x, obj_player.y, obj_blocking, false, true) != noone) {
			state = "check out";
			position_target_x = obj_player.x;
			position_target_y = obj_player.y;
			exit;
		}
		times_fired++;
		if(distance_to_object(obj_player) >= attack_range_break) {
			state = "check out";
			position_target_x = obj_player.x;
			position_target_y = obj_player.y;
		}
		attack_timer = attack_time;
		var shot_x = x;
		var shot_y = y;
		switch(weapon) {
			case "M1911":
				attack_timer = obj_controller.shoot_timer_m1911;
				var shot = instance_create_layer(shot_x, shot_y, "Instances", obj_shot_enemy);
				shot.direction = image_angle_ + random_range(-obj_controller.spread_m1911, obj_controller.spread_m1911);
				shot.speed = obj_controller.shotspeed_m1911;
				shot.friction = obj_controller.friction_m1911;
				shot.damage = obj_controller.damage_m1911;
				shot.image_angle = image_angle_;
				if(times_fired >= obj_controller.ammo_m1911) {
					attack_timer = obj_controller.shoot_timer_m1911 * 4;
					times_fired = 0;
				}
				recoil_timer = obj_controller.recoil_m1911;
				image_index = 1;
				audio_play_sound(snd_m1911, 1, false);
				break;
			case "Revolver":
				attack_timer = obj_controller.shoot_timer_revolver;
				var shot = instance_create_layer(shot_x, shot_y, "Instances", obj_shot_enemy);
				shot.direction = image_angle_ + random_range(-obj_controller.spread_revolver, obj_controller.spread_revolver);
				shot.speed = obj_controller.shotspeed_revolver;
				shot.friction = obj_controller.friction_revolver;
				shot.damage = obj_controller.damage_revolver;
				shot.image_angle = image_angle_;
				if(times_fired >= obj_controller.ammo_revolver) {
					attack_timer = obj_controller.shoot_timer_revolver * 4;
					times_fired = 0;
				}
				recoil_timer = obj_controller.recoil_revolver;
				image_index = 1;
				audio_play_sound(snd_revolver, 1, false);
				break;
			case "Tommy Gun":
				attack_timer = obj_controller.shoot_timer_tommy_gun;
				var shot = instance_create_layer(shot_x, shot_y, "Instances", obj_shot_enemy);
				shot.direction = image_angle_ + random_range(-obj_controller.spread_tommy_gun, obj_controller.spread_tommy_gun);
				shot.speed = obj_controller.shotspeed_tommy_gun;
				shot.friction = obj_controller.friction_tommy_gun;
				shot.damage = obj_controller.damage_tommy_gun;
				shot.image_angle = image_angle_;
				if(times_fired >= obj_controller.ammo_tommy_gun) {
					attack_timer = 80;
					times_fired = 0;
				}
				recoil_timer = obj_controller.recoil_tommy_gun;
				image_index = 1;
				audio_play_sound(snd_tommy_gun, 1, false);
				break;
			case "Double Barrel":
				attack_timer = obj_controller.shoot_timer_double_barrel;
				for (var i = 0; i < 5; i++) {
					var shot = instance_create_layer(shot_x, shot_y, "Instances", obj_shot_enemy);
					shot.direction = image_angle_ + random_range(-obj_controller.spread_double_barrel, obj_controller.spread_trench_shotgun);
					shot.speed = obj_controller.shotspeed_double_barrel;
					shot.friction = obj_controller.friction_double_barrel;
					shot.damage = obj_controller.damage_double_barrel;
					shot.image_angle = image_angle_;
				}
				if(times_fired >= obj_controller.ammo_double_barrel) {
					attack_timer = obj_controller.shoot_timer_double_barrel * 8;
					times_fired = 0;
				}
				recoil_timer = obj_controller.recoil_double_barrel;
				image_index = 1;
				audio_play_sound(snd_double_barrel, 1, false);
				break;
			case "Trench Shotgun":
				attack_timer = obj_controller.shoot_timer_trench_shotgun;
				for (var i = 0; i < 5; i++) {
					var shot = instance_create_layer(shot_x, shot_y, "Instances", obj_shot_enemy);
					shot.direction = image_angle_ + random_range(-obj_controller.spread_trench_shotgun, obj_controller.spread_trench_shotgun);
					shot.speed = obj_controller.shotspeed_trench_shotgun;
					shot.friction = obj_controller.friction_trench_shotgun;
					shot.damage = obj_controller.damage_trench_shotgun;
					shot.image_angle = image_angle_;
				}
				if(times_fired >= obj_controller.ammo_trench_shotgun) {
					attack_timer = obj_controller.shoot_timer_trench_shotgun * 4;
					times_fired = 0;
				}
				recoil_timer = obj_controller.recoil_trench_shotgun;
				image_index = 1;
				audio_play_sound(snd_trench_shotgun, 1, false);
				break;
		}
	}
}