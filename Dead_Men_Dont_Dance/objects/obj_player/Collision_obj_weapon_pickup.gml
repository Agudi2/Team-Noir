if(keyboard_check(ord("E")) and weapon_sprite != spr_empty) {
	var thrown = instance_create_layer(x, y, "Instances", obj_weapon_throw);
	thrown.direction = image_angle_;
	thrown.speed = random_range(7,10)
	thrown.ammo = ammo
	switch(weapon) {
		case "M1911":
			thrown.sprite_index = spr_m1911;
			break;
		case "Revolver":
			thrown.sprite_index = spr_revolver;
			break;
		case "Tommy Gun":
			thrown.sprite_index = spr_tommy_gun;
			break;
		case "Double Barrel":
			thrown.sprite_index = spr_double_barrel;
			break;
		case "Trench Shotgun":
			thrown.sprite_index = spr_trench_shotgun;
			break;
	}
	weapon = "None"
	weapon_sprite = spr_empty;
	ammo = 0;
}