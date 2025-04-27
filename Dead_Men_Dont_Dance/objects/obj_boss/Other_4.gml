if(instance_exists(obj_player)) {
	obj_player.weapon = "None";
	obj_player.weapon_sprite = spr_empty;
	obj_player.ammo = 0;
	obj_player.grenades = 0;
	if(obj_player.roll_timer <= 0) {
		obj_player.sprite_index = spr_player;
	} else {
		obj_player.saved_sprite = spr_player;
	}
}