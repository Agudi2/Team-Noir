if(keyboard_check_pressed(ord("D"))) {
	if(debug) {
		debug = false;
	} else {
		debug = true;
	}
}
if(keyboard_check_pressed(ord("R"))) {
	room_restart();
}