if(instance_exists(obj_XieLian)) {
	if (obj_XieLian.state == PLAYERSTATE.DEATH) {
		// If the player is dead, we want to move the camera to the respawn location instead of the player's position
		target_x = x;
		target_y = y;
	} else {
		target_x = obj_XieLian.x;
		target_y = obj_XieLian.y;
	}
}


alarm[0] = 60;
