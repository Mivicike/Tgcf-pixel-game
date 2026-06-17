time_to_display_buttons = 1;

// Create "continue" button that respawns the player at the village
var xPos = view_get_wport(view_camera[0]) / 2;
var yPos = view_get_hport(view_camera[0]) / 2 + 50; // Adjust the Y position to place it below the center of the screen
instance_create_depth(xPos, yPos, -9999, obj_ButtonRespawn);