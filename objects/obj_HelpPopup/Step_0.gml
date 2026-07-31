if (just_opened) {
	just_opened = false;
	exit;
}

var _key_pressed   = keyboard_check_pressed(vk_anykey);
var _mouse_pressed = mouse_check_button_pressed(mb_left)
					|| mouse_check_button_pressed(mb_right)
					|| mouse_check_button_pressed(mb_middle);

if (_key_pressed || _mouse_pressed) {
	instance_destroy();
}