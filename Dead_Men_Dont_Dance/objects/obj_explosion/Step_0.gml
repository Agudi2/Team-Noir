if(timer > 0) {
	var _list = ds_list_create();
	var _num = collision_circle_list(x, y, radius, all, false, true, _list, false);
	for (var i = 0; i < _num; i++) {
	    var inst = _list[| i];
	    if (inst.object_index == obj_enemy || inst.object_index == obj_player) {
			var sight_line = collision_line(x, y, inst.x, inst.y, obj_blocking, 0, 0);
			if(sight_line == noone) {
				if(inst.object_index == obj_player) {
					if(!inst.invincible) {
						instance_destroy(inst);
					}
				} else {
					instance_destroy(inst);
				}
			}
	    }
	}
}
timer--;