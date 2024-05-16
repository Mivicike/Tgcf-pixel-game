
//collision check function
function collisionDetection() {
    // Keyboard checks
    right = keyboard_check_direct(vk_right) or keyboard_check_direct(ord("D"));
    left = keyboard_check_direct(vk_left) or keyboard_check_direct(ord("A"));
    up = keyboard_check_direct(vk_up) or keyboard_check_direct(ord("W"));
    down = keyboard_check_direct(vk_down) or keyboard_check_direct(ord("S"));

    // Walk down
    if (down) {
        collision_enemy = collision_line(x, y, x, y + 50, all, false, true);
        myDirection = 180;
    }
    // Walk Left
    if (left) {
        collision_enemy = collision_line(x, y, x - 50, y, all, false, true);
        myDirection = 270;
    }
    // Walk up
    if (up) {
        collision_enemy = collision_line(x, y, x, y - 50, all, false, true);
        myDirection = 0;
    }
    // Walk Right
    if (right) { // Corrected to "right" here
        collision_enemy = collision_line(x, y, x + 50, y, all, false, true);
        myDirection = 90;
    }
	//show_debug_message(myDirection)
    //show_debug_message(collision_enemy);
}

// Switch statement to handle player state
switch (state) {
    case PLAYERSTATE.FREE:
        scr_PlayerStateFree(); 
        break;
    // Add other cases for different player states if needed
}

// Call the function to handle player movement
collisionDetection();



//camera
halfview_Width = camera_get_view_width(view_camera[0]) / 2;
halfview_Height = camera_get_view_height(view_camera[0]) / 2;

camera_set_view_pos(view_camera[0], x - halfview_Width, y - halfview_Height);

