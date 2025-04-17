var _list = ds_list_create();
var _num = collision_circle_list(x, y, radius, all, false, true, _list, false);
for (var i = 0; i < _num; i++) {
    var inst = _list[| i];
    if (inst.object_index == obj_enemy || inst.object_index == obj_player) {
		var sight_line = collision_line(x, y, _list[| i].x, _list[| i].y, obj_wall, 0, 0);
		if(sight_line == noone) {
			instance_destroy(inst);
		}
    }
}

var __list = ds_list_create();
var __num = collision_circle_list(x, y, circle_sound_range, obj_enemy, false, true, __list, false);
for(var i = 0; i < __num; i++) {
	__list[| i].state = "check out";
	__list[| i].position_target_x = x;
	__list[| i].position_target_y = y;
	__list[| i].player_sighted = 0;
}