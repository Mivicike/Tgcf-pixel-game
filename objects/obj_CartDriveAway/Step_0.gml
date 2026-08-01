depth = -bbox_bottom;
if (driving) {
	x -= move_speed;
	traveled += move_speed;
	if (traveled >= travel_distance) {
		driving = false;
	}
} else {
	var dt = delta_time / 1000000;
	fade_timer += dt;
	image_alpha = clamp(1 - (fade_timer / fade_duration), 0, 1);
	if (fade_timer >= fade_duration) {
		instance_destroy();
	}
}