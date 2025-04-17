var _list = ds_list_create();
var _num = collision_circle_list(x, y, radius, all, false, true, _list, false);
for (var i = 0; i < _num; i++) {
    var inst = _list[| i];
    if (inst.object_index == obj_enemy || inst.object_index == obj_player) {
		var sight_line = collision_line(x, y, _list[| i].x, _list[| i].y, obj_blocking, 0, 0);
		if(sight_line == noone) {
			instance_destroy(inst);
		}
    }
}
