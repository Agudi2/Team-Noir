if(obj_controller.debug) {
	draw_circle(x, y, circle_sound_range, 1)
	if(timer > 0) {
		draw_circle_color(x, y, radius, c_red, c_red, 0);
	}
}
draw_self();