if(other.grenades < 3 and other.roll_timer <= 0) {
	if(keyboard_check_pressed(ord("E"))) {
		other.grenades++;
		instance_destroy();
	}
}
