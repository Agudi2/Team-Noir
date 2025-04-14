image_angle = point_direction(x,y, mouse_x, mouse_y);

var left = keyboard_check(ord("A"));
var right = keyboard_check(ord("D"));
var up = keyboard_check(ord("W"));
var down = keyboard_check(ord("S"));

var horizontalSpeed = right - left;
var verticalSpeed = down - up;
x += horizontalSpeed * walk_speed;
y += verticalSpeed * walk_speed;


if (xprevious == x and yprevious == y) {
	image_speed = 0;
	walk_timer = 0;
} else {
	image_speed = 1;
	walk_timer += 1;
}

if (mouse_check_button_released(mb_right) and weapon_sprite != spr_empty) {
	var thrown = instance_create_layer(x, y, "Instances", obj_weapon_throw);
	thrown.direction = image_angle;
	thrown.speed = random_range(7,10)
	switch(weapon) {
		case "machine gun":
			thrown.sprite_index = spr_machine_gun;
			break;
		case "shotgun":
			thrown.sprite_index = spr_shotgun;
			break;
	}
	weapon = ""
	weapon_sprite = spr_empty;
}