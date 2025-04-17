if(path_exists(path)) {
	path_delete(path);
}
path = path_add();
mp_grid_path(obj_pathway_setup.grid, path, x, y, position_start_x, position_start_y, 1);
path_start(path, walkspeed_alert, path_action_stop, true);