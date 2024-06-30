depth = -bbox_bottom;

// Switch statement to handle player state
switch (state) {
    case PLAYERSTATE.FREE:
        scr_PlayerStateFree();
		break;
	case PLAYERSTATE.ATTACK:
		scr_PlayerState_Attack_Combo();
        break;
	case PLAYERSTATE.DASH:
		scr_PlayerStateDash();
		break;
    // Add other cases for different player states if needed
}


// Call the function to handle player movement
collision_detection();

//camera
halfview_width = camera_get_view_width(view_camera[0]) / 2;
halfview_height = camera_get_view_height(view_camera[0]) / 2;

camera_set_view_pos(view_camera[0], x - halfview_width, y - halfview_height);