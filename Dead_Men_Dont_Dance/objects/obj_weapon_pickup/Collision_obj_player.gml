if(keyboard_check(ord("E"))) {
	switch(sprite_index) {
		case spr_machine_gun:
			other.weapon_sprite = spr_player_gun_PLACEHOLDER;
			other.weapon = "machine gun";
			break;
		case spr_shotgun:
			other.weapon_sprite = spr_player_gun_PLACEHOLDER;
			other.weapon = "shotgun";
			break;
	}
	instance_destroy();
}
