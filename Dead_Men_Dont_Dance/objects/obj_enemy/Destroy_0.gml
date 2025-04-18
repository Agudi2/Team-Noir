if(weapon_sprite != spr_empty) {
	var passed_sprite = spr_m1911;
	var passed_ammo = 0;
	switch(weapon) {
		case "M1911":
			passed_sprite = spr_m1911;
			passed_ammo = obj_controller.ammo_m1911;
			break;
		case "Revolver":
			passed_sprite = spr_revolver;
			passed_ammo = obj_controller.ammo_revolver;
			break;
		case "Tommy Gun":
			passed_sprite = spr_tommy_gun;
			passed_ammo = obj_controller.ammo_tommy_gun;
			break;
		case "Double Barrel":
			passed_sprite = spr_double_barrel;
			passed_ammo = obj_controller.ammo_double_barrel;
			break;
		case "Trench Shotgun":
			passed_sprite = spr_trench_shotgun;
			passed_ammo = obj_controller.ammo_trench_shotgun;
			break;
	
	}

	var pickup = instance_create_layer(x, y, "Instances", obj_weapon_pickup);
	pickup.sprite_index = passed_sprite;
	pickup.ammo = passed_ammo;
}