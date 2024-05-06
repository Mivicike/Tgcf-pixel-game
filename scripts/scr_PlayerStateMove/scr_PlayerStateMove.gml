
//walking
if (keyboard_check_direct(vk_down) or keyboard_check_direct(ord("S"))) {
y += hws;
	image_speed = hws / 1;
	sprite_index = Xielianwalkdown;
}
if (keyboard_check_direct(vk_left) or keyboard_check_direct(ord("A"))) {
x -= vws;
	image_speed = vws / 1;
	sprite_index = XieLianwalkleft;
}
if (keyboard_check_direct(vk_up) or keyboard_check_direct(ord("W"))) {
y -= hws;
	image_speed = hws / 1;
	sprite_index = XieLianwalkup;
}
if (keyboard_check_direct(vk_right) or keyboard_check_direct(ord("D"))) {
x += vws;
	image_speed = vws / 1;
	sprite_index = XieLianwalkright;
}