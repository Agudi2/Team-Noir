if(keyboard_check_released(ord("P"))) {
	obj_enemy.position_target_x = mouse_x;
	obj_enemy.position_target_y = mouse_y;
	obj_enemy.state = "check out";
}