if(phase == 2) {
	shoot_timer--;
	throw_timer--;
	if(shoot_timer <= 0) {
		shoot_timer = obj_controller.shoot_timer_tommy_gun;
		var shot = instance_create_layer(x, y, "Instances", obj_shot_enemy);
		shot.direction = image_angle+90;
		shot.speed = obj_controller.shotspeed_tommy_gun;
		shot.friction = obj_controller.friction_tommy_gun;
		shot.damage = obj_controller.damage_tommy_gun;
		shot.image_angle = image_angle+90;
		shoot_timer = obj_controller.shoot_timer_tommy_gun;
		shot = instance_create_layer(x, y, "Instances", obj_shot_enemy);
		shot.direction = image_angle-90;
		shot.speed = obj_controller.shotspeed_tommy_gun;
		shot.friction = obj_controller.friction_tommy_gun;
		shot.damage = obj_controller.damage_tommy_gun;
		shot.image_angle = image_angle-90;
		audio_play_sound(snd_tommy_gun, 1, false);
		if(throw_timer <= 0 and weapons_thrown < 5) {
			var weapon = instance_create_layer(x, y, "Instances", obj_weapon_throw);
			weapon.direction = direction;
			weapon.speed = 10;
			weapon.friction = 0.4;
			var type = irandom(3);
			switch(type) {
				case 0:
					weapon.ammo = 10;
					weapon.sprite_index = spr_m1911;
					break;
				case 1:
					weapon.ammo = 6;
					weapon.sprite_index = spr_revolver;
					break;
				case 2:
					weapon.ammo = 2;
					weapon.sprite_index = spr_double_barrel;
					break;
				case 3:
					weapon.ammo = 4;
					weapon.sprite_index = spr_trench_shotgun;
					break;
			}
			throw_timer = 120;
			weapons_thrown++;
		}
	}
	image_angle += spin;
	direction += spin;
	if(health_points <= 60) {
		alarm[2] = 30;
		phase = -1;
	}
}

if(phase = -1) {
	image_angle = lerp(image_angle, 180, 0.1);
}