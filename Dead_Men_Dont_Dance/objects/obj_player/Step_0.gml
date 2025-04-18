direction = point_direction(x,y, mouse_x, mouse_y);
image_angle_ = direction;


var left = keyboard_check(ord("A"));
var right = keyboard_check(ord("D"));
var up = keyboard_check(ord("W"));
var down = keyboard_check(ord("S"));

var horizontalSpeed = right - left;
var verticalSpeed = down - up;

if(!place_meeting(x+(horizontalSpeed * walk_speed), y, obj_wall)) {
	x += horizontalSpeed * walk_speed;
}
if(!place_meeting(x, y+(verticalSpeed * walk_speed), obj_wall)) {
	y += verticalSpeed * walk_speed;
}

if (xprevious == x and yprevious == y) {
	image_speed = 0;
	walk_timer = 0;
} else {
	image_speed = 1;
	walk_timer += 1;
}

if (mouse_check_button_released(mb_right) and weapon_sprite != spr_empty) {
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
	weapon = ""
	weapon_sprite = spr_empty;
	ammo = 0;
}

if (keyboard_check_pressed(ord("G")) and grenades > 0) {
	var thrown = instance_create_layer(x, y, "Instances", obj_grenade);
	thrown.direction = image_angle_;
	thrown.speed = random_range(7,10);
	grenades--;
}

shoot_timer--;
shoot_timer = clamp(shoot_timer, 0, shoot_timer);
if(mouse_check_button(mb_left) and ammo > 0) {
	if(shoot_timer <= 0) {
		var shot_x = x;
		var shot_y = y;
		var _list = ds_list_create();
		var _num = collision_circle_list(x, y, circle_sound_range, obj_enemy, false, true, _list, false);
		for(var i = 0; i < _num; i++) {
			if(_list[| i].state != "attack") {
				_list[| i].state = "check out";
			}
			_list[| i].position_target_x = x;
			_list[| i].position_target_y = y;
		}
		switch(weapon) {
			case "M1911":
				shoot_timer = obj_controller.shoot_timer_m1911;
				var shot = instance_create_layer(shot_x, shot_y, "Instances", obj_shot);
				shot.direction = image_angle_ + random_range(-obj_controller.spread_m1911, obj_controller.spread_m1911);
				shot.speed = obj_controller.shotspeed_m1911;
				shot.friction = obj_controller.friction_m1911;
				shot.damage = obj_controller.damage_m1911;
				shot.image_angle = image_angle_;
				ammo--;
				break;
			case "Revolver":
				shoot_timer = obj_controller.shoot_timer_revolver;
				var shot = instance_create_layer(shot_x, shot_y, "Instances", obj_shot);
				shot.direction = image_angle_ + random_range(-obj_controller.spread_revolver, obj_controller.spread_revolver);
				shot.speed = obj_controller.shotspeed_revolver;
				shot.friction = obj_controller.friction_revolver;
				shot.damage = obj_controller.damage_revolver;
				shot.image_angle = image_angle_;
				ammo--;
				break;
			case "Tommy Gun":
				shoot_timer = obj_controller.shoot_timer_tommy_gun;
				var shot = instance_create_layer(shot_x, shot_y, "Instances", obj_shot);
				shot.direction = image_angle_ + random_range(-obj_controller.spread_tommy_gun, obj_controller.spread_tommy_gun);
				shot.speed = obj_controller.shotspeed_tommy_gun;
				shot.friction = obj_controller.friction_tommy_gun;
				shot.damage = obj_controller.damage_tommy_gun;
				shot.image_angle = image_angle_;
				ammo--;
				break;
			case "Double Barrel":
				shoot_timer = obj_controller.shoot_timer_double_barrel;
				for (var i = 0; i < 5; i++) {
					var shot = instance_create_layer(shot_x, shot_y, "Instances", obj_shot);
					shot.direction = image_angle_ + random_range(-obj_controller.spread_double_barrel, obj_controller.spread_trench_shotgun);
					shot.speed = obj_controller.shotspeed_double_barrel;
					shot.friction = obj_controller.friction_double_barrel;
					shot.damage = obj_controller.damage_double_barrel;
					shot.image_angle = image_angle_;
				}
				ammo--;
				break;
			case "Trench Shotgun":
				shoot_timer = obj_controller.shoot_timer_trench_shotgun;
				for (var i = 0; i < 5; i++) {
					var shot = instance_create_layer(shot_x, shot_y, "Instances", obj_shot);
					shot.direction = image_angle_ + random_range(-obj_controller.spread_trench_shotgun, obj_controller.spread_trench_shotgun);
					shot.speed = obj_controller.shotspeed_trench_shotgun;
					shot.friction = obj_controller.friction_trench_shotgun;
					shot.damage = obj_controller.damage_trench_shotgun;
					shot.image_angle = image_angle_;
				}
				ammo--;
				break;
		}
		
	}
}
