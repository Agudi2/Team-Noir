function fade_to_next(){
	if (!instance_exists(obj_fade)) {
        instance_create_layer(-64, -64, "Instances", obj_fade);
    }

    with (obj_fade) {
        state = "fade_out";
    }
}