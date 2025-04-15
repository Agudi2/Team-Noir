if(keyboard_check_released(ord("E"))) {
	switch(sprite_index) {
		case spr_machine_gun:
			other.weapon_sprite = spr_player_gun_PLACEHOLDER;
			other.weapon = "Machine Gun";
			break;
		case spr_shotgun:
			other.weapon_sprite = spr_player_gun_PLACEHOLDER;
			other.weapon = "Shotgun";
			break;
	}
	
	other.ammo = ammo;
	instance_destroy();
}
