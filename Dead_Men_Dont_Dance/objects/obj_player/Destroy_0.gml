if(weapon_sprite != spr_empty) {
	var passed_sprite = spr_pistol;
	var passed_ammo = 0;
	switch(weapon) {
		case "Pistol":
			passed_sprite = spr_pistol;
			passed_ammo = obj_controller.ammo_pistol;
			break;
		case "Machine Gun":
			passed_sprite = spr_machine_gun;
			passed_ammo = obj_controller.ammo_machine_gun;
			break;
		case "Shotgun":
			passed_sprite = spr_shotgun;
			passed_ammo = obj_controller.ammo_shotgun;
			break;
	
	}

	var pickup = instance_create_layer(x, y, "Instances", obj_weapon_pickup);
	pickup.sprite_index = passed_sprite;
	pickup.ammo = passed_ammo;
}