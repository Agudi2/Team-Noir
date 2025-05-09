var bar_width = 100;
var bar_height = 10;
var margin = 15;

var fill_ratio = health_points/health_total;
fill_ratio = clamp(fill_ratio, 0, 1);

draw_set_color(c_black);
draw_rectangle(x-bar_width/2, y-32, x+bar_width/2, y-32+bar_height, false);

draw_set_color(c_ltgrey);
draw_rectangle(x-bar_width/2, y-32, x-bar_width/2+bar_width*fill_ratio, y-32+bar_height, false);

draw_set_color(c_white);
draw_rectangle(x-bar_width/2, y-32, x+bar_width/2, y-32+bar_height, true);

if(walk_timer > 5) {
	draw_sprite_ext(spr_feet, floor(feet_image_index) mod sprite_get_number(spr_feet), x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
}

draw_self();

if(obj_controller.debug) {
	draw_text(x, y+20, string(phase));
}
