// Step Event of the Character Object (assuming the sprite is facing up or down)
var line_x = x; // Set the starting x-coordinate of the line
var line_y_start = y; // Set the starting y-coordinate of the line
var line_y_end = y + 50; // Set the ending y-coordinate of the line

// Check for collisions with the fence using a collision line
var collision_object = collision_rectangle(x, y, x, y-50, obj_XieLian, false, true);

show_debug_message(collision_object)
//if (collision_object != noone) {
	//show_debug_message("hello")
    //obj_fence.depth = depth + 1; // Place fence over the character if there's a collision
//} else {
    //obj_fence.depth = depth - 1; // Place fence under the character if there's no collision
//}