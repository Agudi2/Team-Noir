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

var corpse = instance_create_layer(x, y, "Instances", obj_enemy_dead);
var pose = irandom(2);
switch(pose) {
	case 0:
		corpse.sprite_index = spr_enemy_dead_1;
		break;
	case 1:
		corpse.sprite_index = spr_enemy_dead_2;
		break;
	case 2:
		corpse.sprite_index = spr_enemy_dead_3;
		break;
}
corpse.image_xscale = image_xscale;
corpse.image_yscale = image_yscale;
corpse.image_angle = image_angle_;
corpse.direction = direction;

var blood = instance_create_layer(x, y, "Instances", obj_blood_pool);
var pool = irandom(2);
switch(pool) {
	case 0:
		blood.sprite_index = spr_blood_1;
		break;
	case 1:
		blood.sprite_index = spr_blood_2;
		break;
	case 2:
		blood.sprite_index = spr_blood_3;
		break;
}
blood.image_xscale = image_xscale;
blood.image_yscale = image_yscale;
blood.image_angle = image_angle_;
blood.direction = direction;