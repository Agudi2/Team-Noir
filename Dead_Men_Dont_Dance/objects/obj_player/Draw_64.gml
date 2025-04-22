var bar_width = 200;
var bar_height = 20;
var margin = 30;

var x_pos = display_get_gui_width() - bar_width - margin;
var y_pos = display_get_gui_height() - bar_height - margin;


var fill_ratio = 1 - (roll_reset_timer / roll_reset);
fill_ratio = clamp(fill_ratio, 0, 1);

draw_set_color(c_black);
draw_rectangle(x_pos, y_pos, x_pos + bar_width, y_pos + bar_height, false);

draw_set_color(c_white);
draw_rectangle(x_pos, y_pos, x_pos + bar_width * fill_ratio, y_pos + bar_height, false);

draw_rectangle(x_pos, y_pos, x_pos + bar_width, y_pos + bar_height, true);
