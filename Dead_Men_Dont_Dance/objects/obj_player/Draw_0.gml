if(walk_timer > 5) {
	draw_sprite_ext(spr_feet_PLACEHOLDER, image_index, x, y, image_xscale, image_yscale, image_angle_, image_blend, image_alpha);
}
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle_, image_blend, image_alpha);

draw_sprite_ext(weapon_sprite, image_index, x, y, image_xscale, image_yscale, image_angle_, image_blend, image_alpha);

draw_set_font(fsmall);
draw_text(camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0])+camera_get_view_height(view_camera[0])-20, "Ammo: " + string(ammo))
draw_text(camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0])+camera_get_view_height(view_camera[0])-20-string_height("A"), "Weapon: " + string(weapon))
draw_set_font(fdefault);

if(obj_controller.debug) {
	draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, 1);
	draw_set_alpha(0.3);
	draw_circle(x, y, circle_range, 1);
	draw_set_alpha(1);
}
