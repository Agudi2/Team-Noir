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
			_list[| i].state = "check out";
			_list[| i].position_target_x = x;
			_list[| i].position_target_y = y;
			if( _list[| i].player_sighted > 0) {
				_list[| i].player_sighted = 0;
			}
		}
		switch(weapon) {
			case "Pistol":
				shoot_timer = obj_controller.shoot_timer_pistol;
				var shot = instance_create_layer(shot_x, shot_y, "Instances", obj_shot);
				shot.direction = image_angle_ + random_range(-obj_controller.spread_pistol, obj_controller.spread_pistol);
				shot.speed = obj_controller.shotspeed_pistol;
				shot.friction = obj_controller.friction_pistol;
				shot.damage = obj_controller.damage_pistol;
				shot.image_angle = image_angle_;
				ammo--;
				break;
			case "Machine Gun":
				shoot_timer = obj_controller.shoot_timer_machine_gun;
				var shot = instance_create_layer(shot_x, shot_y, "Instances", obj_shot);
				shot.direction = image_angle_ + random_range(-obj_controller.spread_machine_gun, obj_controller.spread_machine_gun);
				shot.speed = obj_controller.shotspeed_machine_gun;
				shot.friction = obj_controller.friction_machine_gun;
				shot.damage = obj_controller.damage_machine_gun;
				shot.image_angle = image_angle_;
				ammo--;
				break;
			case "Shotgun":
				shoot_timer = obj_controller.shoot_timer_shotgun;
				for (var i = 0; i < 5; i++) {
					var shot = instance_create_layer(shot_x, shot_y, "Instances", obj_shot);
					shot.direction = image_angle_ + random_range(-obj_controller.spread_shotgun, obj_controller.spread_machine_gun);
					shot.speed = obj_controller.shotspeed_shotgun;
					shot.friction = obj_controller.friction_shotgun;
					shot.damage = obj_controller.damage_shotgun;
					shot.image_angle = image_angle_;
				}
				ammo--;
				break;
		}
		
	}
}
