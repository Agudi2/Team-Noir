draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle_, image_blend, image_alpha);
draw_sprite(spr_debug_state, emote_index, x, y-20);

if(obj_controller.debug) {
	draw_set_alpha(0.4);
	draw_circle_color(position_start_x, position_start_y, 3, c_orange, c_orange, 0);
	draw_circle_color(position_target_x, position_target_y, 3, c_red, c_red, 0);
	draw_set_alpha(1);
	draw_text(x, y+40, player_sighted);
	
	draw_set_alpha(0.1);
	draw_circle_color(x, y, attack_range, c_red, c_red, 0);
	draw_circle_color(x, y, attack_range_break, c_blue, c_blue, 0);
	draw_set_alpha(1);
	
	var angle_diff = line_of_sight_width;
	var line_length = attack_range;
	var line_middle_x = x + lengthdir_x(line_length, image_angle_)
	var line_middle_y = y + lengthdir_y(line_length, image_angle_)
	
	var line_top_x = x + lengthdir_x(line_length, image_angle_-angle_diff)
	var line_top_y = y + lengthdir_y(line_length, image_angle_-angle_diff)
	
	var line_bottom_x = x + lengthdir_x(line_length, image_angle_+angle_diff)
	var line_bottom_y = y + lengthdir_y(line_length, image_angle_+angle_diff)
	
	draw_line_width_color(x, y, line_middle_x, line_middle_y, 2, c_red, c_red);
	draw_line_width_color(x, y, line_top_x, line_top_y, 2, c_orange, c_orange);
	draw_line_width_color(x, y, line_bottom_x, line_bottom_y, 2, c_orange, c_orange);
	
}