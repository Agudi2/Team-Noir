var targetx = 16;
var targety = 16;
var weapon_thrown = false;
for(var col = 0; col < 7; col++) {
	for(var row = 0; row < 4; row++) {
		var _direction = point_direction(x, y, targetx, targety);
		var _speed = calculate_initial_speed(x, y, targetx, targety, 0.4);
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
					weapon.ammo = 5;
					weapon.sprite_index = spr_trench_shotgun;
					break;
			}
			weapon_thrown = true;
			weapons_thrown++;
		} else {
			var grenade = instance_create_layer(x, y, "Instances", obj_grenade);
			grenade.direction = _direction;
			grenade.speed = _speed;
			grenade.radius = 40;
		}
		targety += 96;
	}
	targety = 16;
	targetx += 96;
}

if(health_points > 120) {
	alarm[0] = 90;
} else {
	alarm[2] = 30;
}