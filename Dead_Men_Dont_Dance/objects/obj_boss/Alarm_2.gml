if(instance_exists(obj_weapon_pickup)) {
	instance_destroy(obj_weapon_pickup);
}

if(instance_exists(obj_weapon_throw)) {
	instance_destroy(obj_weapon_throw);
}

if(instance_exists(obj_player)) {
	obj_player.weapon = "None";
	obj_player.weapon_sprite = spr_empty;
	obj_player.ammo = 0;
	if(obj_player.roll_timer <= 0) {
		obj_player.sprite_index = spr_player;
	} else {
		obj_player.saved_sprite = spr_player;
	}
}

alarm[3] = 90;