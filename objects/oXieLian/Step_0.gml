if (keyboard_check(vk_down)) {
y += walkspeed;
	image_speed = walkspeed / 1;
	sprite_index = Xielianwalkdown;
}
if (keyboard_check(vk_left)) {
x -= walkspeed;
	image_speed = walkspeed / 1;
	sprite_index = XieLianwalkleft;
}
if (keyboard_check(vk_up)) {
y -= walkspeed;
	image_speed = walkspeed / 1;
	sprite_index = XieLianwalkup;
}
if (keyboard_check(vk_right)) {
x += walkspeed;
	image_speed = walkspeed / 1;
	sprite_index = XieLianwalkright;
}

if (keyboard_check(vk_nokey)) {
	image_speed = 0;
	image_index = 0;
}

KeyAttack = keyboard_check_pressed(ord("X"));

halfview_Width = camera_get_view_width(view_camera[0]) / 2;
halfview_Height = camera_get_view_height(view_camera[0]) / 2;

camera_set_view_pos(view_camera[0], x - halfview_Width, y - halfview_Height);

