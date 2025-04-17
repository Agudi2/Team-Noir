if(other.grenades < 3) {
	if(keyboard_check_pressed(ord("E"))) {
		other.grenades++;
		instance_destroy();
	}
}
