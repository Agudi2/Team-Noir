var boss_x = 320;
var boss_y = 192;
var target_x = 48;
var target_y = 48;

var angle_to_target_rad = arctan2(target_y - boss_y, target_x - boss_x);
var angle_to_target_deg = radtodeg(angle_to_target_rad);