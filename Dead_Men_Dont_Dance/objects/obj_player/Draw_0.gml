if(walk_timer > 5 && roll_timer <= 0) {
	draw_sprite_ext(spr_feet, floor(feet_image_index) mod sprite_get_number(spr_feet), x, y, image_xscale, image_yscale, image_angle_, image_blend, image_alpha);
}
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle_, image_blend, image_alpha);

if(obj_controller.debug) {
	draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, 1);
	draw_set_alpha(0.3);
	draw_circle(x, y, circle_range, 1);
	draw_circle(x, y, circle_sound_range, 1);
	draw_set_alpha(1);
}
