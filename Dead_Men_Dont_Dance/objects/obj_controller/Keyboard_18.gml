if(keyboard_check_pressed(ord("D"))) {
	if(debug) {
		debug = false;
	} else {
		debug = true;
	}
}

if(keyboard_check_pressed(ord("R"))) {
	room_restart();
}

if(keyboard_check_pressed(ord("I"))) {
	if(instance_exists(obj_player)) {
		obj_player.invincible = !obj_player.invincible;
		obj_player.cheat_invincible = !obj_player.cheat_invincible;
	}
}

if(keyboard_check_pressed(ord("N"))) {
	if(instance_exists(obj_player)) {
		obj_player.cheat_infinite_ammo = !obj_player.cheat_infinite_ammo;
	}
}

if(keyboard_check_pressed(ord("S"))) {
	obj_camera.shake = !obj_camera.shake;
}

