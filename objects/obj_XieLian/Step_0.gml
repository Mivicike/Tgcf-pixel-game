depth = -bbox_bottom;
x = clamp(x, -272, room_width);
y = clamp(y, -272, room_height);

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

//camera_set_view_pos(view_camera[0], x - halfview_width, y - halfview_height);
// Calculate the desired camera position
var cam_x = x - halfview_width;
var cam_y = y - halfview_height;

// Clamp the camera position to ensure it doesn't move beyond the room's boundaries
cam_x = clamp(cam_x, -271, room_width - halfview_width*2);
cam_y = clamp(cam_y, -271, room_height - halfview_height*2);

// Set the camera view position
camera_set_view_pos(view_camera[0], cam_x, cam_y);
