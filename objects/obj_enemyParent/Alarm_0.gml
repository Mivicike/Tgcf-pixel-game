if(instance_exists(obj_XieLian) && distance_to_object(obj_XieLian) < distance_to_player) {
	target_x = obj_XieLian.x;
	target_y = obj_XieLian.y;
}


alarm[0] = 60;
show_debug_message(tilemap)