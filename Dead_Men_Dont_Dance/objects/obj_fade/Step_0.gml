switch (state) {
    case "fade_out":
        fade_alpha += fade_speed;
        if (fade_alpha >= 1) {
            fade_alpha = 1;
            state = "change_room";
        }
        break;

    case "change_room":
        state = "wait_for_room_start";
        room_goto_next();
        break;

    case "fade_in":
        fade_alpha -= fade_speed;
        if (fade_alpha <= 0) {
            fade_alpha = 0;
            state = "idle";
        }
        break;
}

if (fade_alpha <= 0) {
    fade_alpha = 0;
    state = "idle";
    instance_destroy();
}