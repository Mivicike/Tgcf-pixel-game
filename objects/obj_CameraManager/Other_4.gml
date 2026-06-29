// Trigger game fade in whenever a room is loaded
switch(room)
{
	case menu:
		// No fade in for menu
		break;
	default:
		fade_alpha  = 1;
		fade_target = 1;
		alarm[0] = 8;

		GAME_CAMERA.reset_all();

		// Reset the camera to the player and snap to it
		GAME_CAMERA.set_target(obj_XieLian);
		GAME_CAMERA.snap_to_target();
		GAME_CAMERA.zoom_snap(1);
		break;
}