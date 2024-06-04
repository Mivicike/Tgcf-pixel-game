//Keyboard checks	
	right = keyboard_check_direct(vk_right) or keyboard_check_direct(ord("D"));
	left = keyboard_check_direct(vk_left) or keyboard_check_direct(ord("A"));
	up = keyboard_check_direct(vk_up) or keyboard_check_direct(ord("W"));
	down = keyboard_check_direct(vk_down) or keyboard_check_direct(ord("S"));



//Walk down
if (down and place_free(x, y+collision_speed)){
	y += hws;
	image_speed = hws / 1;
	sprite_index = Xielianwalkdown;
	
}
//Walk Left
if (left and place_free(x- collision_speed, y)) {
	x -= vws;
	image_speed = vws / 1;
	sprite_index = XieLianwalkleft;
}
// Walk up
if (up) {
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
if (down and place_free(x+collision_speed, y)) {
	x += vws;
	image_speed = vws / 1;
	sprite_index = XieLianwalkright;
}