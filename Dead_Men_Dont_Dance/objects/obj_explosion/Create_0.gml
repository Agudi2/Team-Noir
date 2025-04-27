timer = 0;
if (audio_is_playing(snd_grenade_explosion)) {
    audio_stop_sound(snd_grenade_explosion);
}
audio_play_sound(snd_grenade_explosion, 1, false);
screen_shake(7, 13);
var __list = ds_list_create();
var __num = collision_circle_list(x, y, circle_sound_range, obj_enemy, false, true, __list, false);
for(var i = 0; i < __num; i++) {
	if(__list[| i].state != "attack") {
		__list[| i].state = "check out";
		__list[| i].position_target_x = x;
		__list[| i].position_target_y = y;
	}
}
