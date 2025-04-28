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
	if(image_angle >= 360) {
		image_angle -= 360;
		direction -= 360;
	}
	if(health_points <= 60) {
		alarm[2] = 30;
		phase = -1;
	}
}

if(phase = -1) {
	image_angle = lerp(image_angle, 0, 0.1);
	direction = lerp(direction, 0, 0.1);
	alarm[4] = 30;
}
if (x-xprev == 0 and y-yprev == 0) {
	feet_image_index = 0;
	image_speed = 0;
	if(phase != 2) {
		image_index = 0;
	}
	walk_timer = 0;
} else {
	feet_image_index += feet_image_speed;
	image_speed = 1;
	walk_timer += 1;
}
xprev=x;
yprev=y;

if(x==616) {
	image_angle = lerp(image_angle, 180, 0.1);
	direction = lerp(direction, 180, 0.1);
	if(abs(image_angle-180)<1 && phase==3) {
		phase = 4;
	}
}

if(phase == 4) {
	for(var i=0; i < array_length(phase2_throws); i++) {
		var weapon_thrown = false;
		var targetx = 616;
		var targety = 16;
		phase2_throws[i] = max(0, phase2_throws[i]-1);
		if(phase2_throws[i]<=0) {
			phase2_throws[i] = max_throw_timer;
			for(var row = 0; row < 8; row++) {
				var _direction = point_direction(x, y, targetx-i*48, targety);
				var _speed = calculate_initial_speed(x, y, targetx-i*48, targety, 0.4);
				targety += 48;
				var rand = irandom(27);
				if(rand == 27 and !weapon_thrown and weapons_thrown < 5) {
					var weapon = instance_create_layer(x, y, "Instances", obj_weapon_throw);
					weapon.direction = _direction;
					weapon.speed = _speed;
					weapon.friction = 0.4;
					var type = irandom(4);
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
							weapon.ammo = 30;
							weapon.sprite_index = spr_tommy_gun;
							break;
						case 3:
							weapon.ammo = 2;
							weapon.sprite_index = spr_double_barrel;
							break;
						case 4:
							weapon.ammo = 4;
							weapon.sprite_index = spr_trench_shotgun;
							break;
					}
					weapon_thrown = true;
					weapons_thrown++;
				} else {
					var grenade = instance_create_layer(x, y, "Instances", obj_grenade);
					grenade.direction = _direction;
					grenade.speed = _speed;
					grenade.radius = 48;
				}
			}
		}
	}
}

if(health_points <=0) {
	instance_destroy();
}