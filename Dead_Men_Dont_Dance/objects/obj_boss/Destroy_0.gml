if(instance_exists(obj_weapon_pickup)) {
	instance_destroy(obj_weapon_pickup);
}

if(instance_exists(obj_weapon_throw)) {
	instance_destroy(obj_weapon_throw);
}

if(instance_exists(obj_player)) {
	obj_player.weapon = "None";
	obj_player.weapon_sprite = spr_empty;
	obj_player.ammo = 0;
	if(obj_player.roll_timer <= 0) {
		obj_player.sprite_index = spr_player;
	} else {
		obj_player.saved_sprite = spr_player;
	}
}

instance_destroy(obj_player, false);
instance_create_layer(x, y, "Instances", obj_win);

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
	case 3:
		corpse.sprite_index = spr_enemy_dead_1;
		break;
	case 4:
		corpse.sprite_index = spr_enemy_dead_1;
		break;
	case 5:
		corpse.sprite_index = spr_enemy_dead_1;
		break;
}
corpse.image_xscale = image_xscale;
corpse.image_yscale = image_yscale;
corpse.image_angle = image_angle;
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
	case 3:
		blood.sprite_index = spr_blood_1;
		break;
	case 4:
		blood.sprite_index = spr_blood_1;
		break;
	case 5:
		blood.sprite_index = spr_blood_1;
		break;
}
blood.image_xscale = image_xscale;
blood.image_yscale = image_yscale;
blood.image_angle = image_angle;
blood.direction = direction;