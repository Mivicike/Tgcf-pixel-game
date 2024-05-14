//Walk down
if ((keyboard_check_direct(vk_down) or keyboard_check_direct(ord("S"))) and place_free(x, y+collision_speed)){
	y += hws;
	image_speed = hws / 1;
	sprite_index = Xielianwalkdown;
}
//Walk Left
if ((keyboard_check_direct(vk_left) or keyboard_check_direct(ord("A"))) and place_free(x- collision_speed, y)) {
	x -= vws;
	image_speed = vws / 1;
	sprite_index = XieLianwalkleft;
}
// Walk up
if ((keyboard_check_direct(vk_up) or keyboard_check_direct(ord("W")))) {
    if (place_free(x, y - collision_speed)) {
        y -= hws;
        image_speed = hws / 1;
        sprite_index = XieLianwalkup;
    } else {
        // Adjust character position to prevent overlapping with the wall
        while (!place_free(x, y - 1)) {
            y += 1;
        }
    }
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