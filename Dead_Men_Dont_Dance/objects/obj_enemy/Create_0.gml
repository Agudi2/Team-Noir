image_xscale = 1.5;
image_yscale = 1.5;

xprev = x;
yprev = y;
walk_timer = 0;
feet_image_index = 0;
feet_image_speed = 0.2;

weapon_sprite = spr_empty;
weapon = "None";
image_speed = 0;
image_angle_ = 0;
recoil_timer = 1;


state = "idle";
emote_index = 0;

path = path_add();
position_start_x = x;
position_start_y = y;
position_target_x = x;
position_target_y = y;

nothing_here_time = 240;
nothing_here_timer = nothing_here_time;

player_sighted = 1;
attack_time = 60;
attack_timer = attack_time;
times_fired = 0;
