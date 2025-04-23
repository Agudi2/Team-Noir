display_set_gui_size(camera_get_view_width(view_camera[0]), camera_get_view_height(view_camera[0]));
var bar_width = 100;
var bar_height = 10;
var margin = 15;

var x_pos = display_get_gui_width() - bar_width - margin;
var y_pos = display_get_gui_height() - bar_height - margin;


var fill_ratio = 1 - (roll_reset_timer / roll_reset);
fill_ratio = clamp(fill_ratio, 0, 1);

draw_set_color(c_black);
draw_rectangle(x_pos, y_pos, x_pos + bar_width, y_pos + bar_height, false);

draw_set_color(c_ltgrey);
draw_rectangle(x_pos, y_pos, x_pos + bar_width * fill_ratio, y_pos + bar_height, false);
draw_set_color(c_white);
draw_rectangle(x_pos, y_pos, x_pos + bar_width, y_pos + bar_height, true);

draw_set_font(fsmall);
draw_set_color(c_black);
for (var ox = -1; ox <= 1; ox++) {
    for (var oy = -1; oy <= 1; oy++) {
        if (ox != 0 || oy != 0) {
            draw_text(8+ox, display_get_gui_height()-20+oy, "Ammo: " + string(ammo));
            draw_text(8+ox, display_get_gui_height()-20-string_height("A")+oy, "Weapon: " + string(weapon));
        }
    }
}

draw_set_color(c_white);
draw_text(8, display_get_gui_height()-20, "Ammo: " + string(ammo));
draw_text(8, display_get_gui_height()-20-string_height("A"), "Weapon: " + string(weapon));

var offset = 8;
for (var i = 0; i < grenades; i++) {
	draw_sprite_ext(spr_grenade, 0, 8+offset, display_get_gui_height()-20-2*string_height("A"), 1, 1, 0, c_white, 1);
    offset += 20;
}

draw_set_font(fdefault);