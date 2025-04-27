var targetx = 16;
var targety = 16;
for(var col = 0; col < 7; col++) {
	for(var row = 0; row < 4; row++) {
		var _direction = point_direction(x, y, targetx, targety);
		var _speed = calculate_initial_speed(x, y, targetx, targety, 0.4);
		var grenade = instance_create_layer(x, y, "Instances", obj_grenade);
		grenade.direction = _direction;
		grenade.speed = _speed;
		grenade.radius = 40;
		targety += 96;
	}
	targety = 16;
	targetx += 96;
}
alarm[0] = 90;