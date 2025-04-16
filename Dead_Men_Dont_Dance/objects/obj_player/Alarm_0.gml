var _list = ds_list_create();
var _num = collision_circle_list(x, y, circle_range, obj_enemy, false, true, _list, false);
if(_num > 0) {
	for(var i = 0; i < _num; i++;) {
		var sight_line = collision_line(x, y, _list[| i].x, _list[| i].y, obj_wall, 0, 0);
		if(sight_line == noone) {
			var line_direction = point_direction(_list[| i].x, _list[| i].y, x, y);
			var angle_diff = abs(angle_difference(line_direction, _list[| i].image_angle_));
			if(angle_diff <= _list[| i].line_of_sight_width) {
				_list[| i].player_sighted -= 1;
			}
		} else {
			_list[| i].player_sighted = 3;
		}
		
		if(_list[| i].player_sighted <= 0) {
			_list[| i].state = "check out";
			_list[| i].position_target_x = x;
			_list[| i].position_target_y = y;
		}
	}
}

alarm[0] = enemy_refresh;