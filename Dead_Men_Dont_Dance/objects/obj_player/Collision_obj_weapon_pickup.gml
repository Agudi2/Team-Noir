if(keyboard_check(ord("E")) and weapon_sprite != spr_empty) {
	var thrown = instance_create_layer(x, y, "Instances", obj_weapon_throw);
	thrown.direction = image_angle_;
	thrown.speed = random_range(7,10)
	thrown.ammo = ammo
	switch(weapon) {
		case "Pistol":
			thrown.sprite_index = spr_pistol;
			break;
		case "Machine Gun":
			thrown.sprite_index = spr_machine_gun;
			break;
		case "Shotgun":
			thrown.sprite_index = spr_shotgun;
			break;
	}
	weapon = "None"
	weapon_sprite = spr_empty;
	ammo = 0;
}