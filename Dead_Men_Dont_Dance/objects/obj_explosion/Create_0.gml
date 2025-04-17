alarm[0] = 30;
radius = 48;
circle_sound_range = 200;

var __list = ds_list_create();
var __num = collision_circle_list(x, y, circle_sound_range, obj_enemy, false, true, __list, false);
for(var i = 0; i < __num; i++) {
	__list[| i].state = "check out";
	__list[| i].position_target_x = x;
	__list[| i].position_target_y = y;
	__list[| i].player_sighted = 0;
}