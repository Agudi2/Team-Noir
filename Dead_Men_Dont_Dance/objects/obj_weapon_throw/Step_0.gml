image_angle += spin;

if(speed < 0.01) {
	var pickup = instance_create_layer(x, y, "Instances", obj_weapon_pickup);
	pickup.sprite_index = sprite_index;
	instance_destroy()
}