display_set_gui_size(camera_get_view_width(view_camera[0]), camera_get_view_height(view_camera[0]));

var text = "Game Over, Press R to Retry";
var text_width = string_width(text);
var text_height = string_height(text);


var screen_x = display_get_gui_width()/2;
var screen_y = display_get_gui_height()/2;

var text_x = screen_x-text_width/2;
var text_y = screen_y-text_height/2;

draw_set_color(c_black);
for (var ox=-1; ox<=1; ox++) {
    for (var oy=-1; oy<=1; oy++) {
        if (ox!=0 or oy!=0) {
            draw_text(text_x+ox, text_y+oy, text);
        }
    }
}

draw_set_color(c_white);
draw_text(screen_x-text_width/2, screen_y-text_height/2, text);