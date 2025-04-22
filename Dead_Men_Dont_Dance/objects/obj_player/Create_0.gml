image_xscale *= 1.5
image_yscale *= 1.5

weapon_sprite = spr_empty;
weapon = "None";
ammo = 0;
shoot_timer = 0;
recoil_timer = 0;
image_angle_ = 0;
grenades = 0;
feet_image_speed = 0.2;
feet_image_index = 0;

enemy_refresh = 10;
alarm[0] = enemy_refresh;
circle_range = 100;
circle_sound_range = 150;

roll_speed = 4;
roll_length = 30;
roll_timer = 0;
roll_reset = 120;
roll_reset_timer = 0;
invincible = false;
saved_sprite = spr_empty;

cheat_invincible = false;