if(instance_exists(obj_XieLian) && distance_to_object(obj_XieLian) < distance_to_player) {
	target_x = obj_XieLian.x;
	target_y = obj_XieLian.y;
}
else {
	target_x = random_range(xstart - 100, xstart + 100)
	target_y = random_range(ystart - 100, ystart + 100)
}

alarm[0] = 60;
show_debug_message(tilemap)