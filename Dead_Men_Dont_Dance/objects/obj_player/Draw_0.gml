if(walk_timer > 5 && roll_timer <= 0) {
	draw_sprite_ext(spr_feet, floor(feet_image_index) mod sprite_get_number(spr_feet), x, y, image_xscale, image_yscale, image_angle_, image_blend, image_alpha);
}
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle_, image_blend, image_alpha);


draw_set_font(fsmall);
draw_text(camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0])+camera_get_view_height(view_camera[0])-20, "Ammo: " + string(ammo));
draw_text(camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0])+camera_get_view_height(view_camera[0])-20-string_height("A"), "Weapon: " + string(weapon));
var offset = 8;
for(var i = 0; i < grenades; i++) {
	draw_sprite(spr_grenade, 0, camera_get_view_x(view_camera[0])+offset, camera_get_view_y(view_camera[0])+camera_get_view_height(view_camera[0])-20-2*string_height("A"));
	offset += 20
}
draw_set_font(fdefault);

if(obj_controller.debug) {
	draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, 1);
	draw_set_alpha(0.3);
	draw_circle(x, y, circle_range, 1);
	draw_circle(x, y, circle_sound_range, 1);
	draw_set_alpha(1);
}
