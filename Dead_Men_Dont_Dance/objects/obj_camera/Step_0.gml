var cameraWidth = camera_get_view_width(view_camera[0]);
var cameraHeight = camera_get_view_height(view_camera[0]);
if(instance_exists(target)) {
	var cameraX = clamp(target.x - cameraWidth/2, 0, room_width - cameraWidth);
	var cameraY = clamp(target.y - cameraHeight/2, 0, room_height - cameraHeight);
	cameraX += random_range(-shake_remain, shake_remain);
	cameraY += random_range(-shake_remain, shake_remain);
	shake_remain = max(0, shake_remain-((1/shake_length)*shake_magnitude));
	camera_set_view_pos(view_camera[0], cameraX, cameraY);
}