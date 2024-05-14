//Walking
//Walk down
if ((keyboard_check_direct(vk_down) or keyboard_check_direct(ord("S"))) and place_free(x, y+collision_speed)){
y += hws;
	image_speed = hws / 1;
	sprite_index = Xielianwalkdown;
	// Check collision and print result
	var collision_result = place_free(x, y + collision_speed);
	show_debug_message("Collision Result: " + string(collision_result));
}
//Walk Left
if ((keyboard_check_direct(vk_left) or keyboard_check_direct(ord("A"))) and place_free(x- collision_speed, y)) {
x -= vws;
	image_speed = vws / 1;
	sprite_index = XieLianwalkleft;
}
//Walk Up
if ((keyboard_check_direct(vk_up) or keyboard_check_direct(ord("W")))) {
y -= hws;
	image_speed = hws / 1;
	sprite_index = XieLianwalkup;
}
//Walk Right
if ((keyboard_check_direct(vk_right) or keyboard_check_direct(ord("D"))) and place_free(x+collision_speed, y)) {
x += vws;
	image_speed = vws / 1;
	sprite_index = XieLianwalkright;
}
//Run faster
if(keyboard_check_direct(vk_shift)) {
	walk_speed = 7
}
	