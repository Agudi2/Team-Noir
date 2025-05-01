image_xscale *= 1.5
image_yscale *= 1.5


shoot_timer = 0;
recoil_timer = 0;
image_angle_ = 0;
feet_image_speed = 0.2;
feet_image_index = 0;

enemy_refresh = 10;
alarm[0] = enemy_refresh;
circle_range = 150;
circle_sound_range = 250;

roll_direction = 0;
roll_speed = 4;
roll_length = 30;
roll_timer = 0;
roll_reset = 60;
roll_reset_timer = 0;
invincible = false;
saved_sprite = spr_empty;

cheat_invincible = false;
cheat_infinite_ammo = false;
hide_ui = false;

if(!instance_exists(obj_controller)) {
	instance_create_layer(-64, -64, "Instances", obj_controller);
}
