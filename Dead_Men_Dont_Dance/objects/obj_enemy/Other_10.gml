if(path_exists(path)) {
	path_delete(path);
}
path = path_add();
var movespeed = 0;
if (player_sighted <= 0) {
	movespeed = walkspeed_attack;
} else {
	movespeed = walkspeed_alert;
}
mp_grid_path(obj_pathway_setup.grid, path, x, y, position_target_x, position_target_y, 1);
path_start(path, movespeed, path_action_stop, true);