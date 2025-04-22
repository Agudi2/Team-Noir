if(other.weapon_sprite == spr_empty && other.roll_timer <= 0) {
	if(keyboard_check_released(ord("E"))) {
		switch(sprite_index) {
			case spr_m1911:
				other.image_speed = 0;
				other.weapon_sprite = spr_player_sidearm;
				other.sprite_index = spr_player_sidearm;
				other.weapon = "M1911";
				break;
			case spr_revolver:
				other.image_speed = 0;
				other.weapon_sprite = spr_player_sidearm;
				other.sprite_index = spr_player_sidearm;
				other.weapon = "Revolver";
				break;
			case spr_tommy_gun:
				other.image_speed = 0;
				other.weapon_sprite = spr_player_primary_arm;
				other.sprite_index = spr_player_primary_arm;
				other.weapon = "Tommy Gun";
				break;
			case spr_double_barrel:
				other.image_speed = 0;
				other.weapon_sprite = spr_player_primary_arm;
				other.sprite_index = spr_player_primary_arm;
				other.weapon = "Double Barrel";
				break;
			case spr_trench_shotgun:
				other.image_speed = 0;
				other.weapon_sprite = spr_player_primary_arm;
				other.sprite_index = spr_player_primary_arm;
				other.weapon = "Trench Shotgun";
				break;
		}
	
		other.ammo = ammo;
		instance_destroy();
	}
}
