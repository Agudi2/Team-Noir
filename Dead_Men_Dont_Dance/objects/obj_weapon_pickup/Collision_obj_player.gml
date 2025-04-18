if(other.weapon_sprite == spr_empty) {
	if(keyboard_check_released(ord("E"))) {
		switch(sprite_index) {
			case spr_m1911:
				other.weapon_sprite = spr_player_gun_PLACEHOLDER;
				other.weapon = "M1911";
				break;
			case spr_revolver:
				other.weapon_sprite = spr_player_gun_PLACEHOLDER;
				other.weapon = "Revolver";
				break;
			case spr_tommy_gun:
				other.weapon_sprite = spr_player_gun_PLACEHOLDER;
				other.weapon = "Tommy Gun";
				break;
			case spr_double_barrel:
				other.weapon_sprite = spr_player_gun_PLACEHOLDER;
				other.weapon = "Double Barrel";
				break;
			case spr_trench_shotgun:
				other.weapon_sprite = spr_player_gun_PLACEHOLDER;
				other.weapon = "Trench Shotgun";
				break;
		}
	
		other.ammo = ammo;
		instance_destroy();
	}
}
