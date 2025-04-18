weapon_sprite = spr_empty;
weapon = "None";
image_speed = 0;
image_angle_ = 0;

sight_range = 120;
state = "idle";
emote_index = 0;

path = path_add();
walkspeed_attack = 0.75;
walkspeed_alert = 0.5;
position_start_x = x;
position_start_y = y;
position_target_x = x;
position_target_y = y;

nothing_here_time = 360;
nothing_here_timer = nothing_here_time;

player_sighted = 1;
attack_time = 60;
switch(weapon) {
	case "Pistol":
		attack_time = obj_controller.shoot_timer_m1911;
	case "Machine Gun":
		attack_time = obj_controller.shoot_timer_tommy_gun;
	case "Shotgun":
		attack_time = obj_controller.shoot_timer_double_barrel;
}
attack_timer = attack_time;