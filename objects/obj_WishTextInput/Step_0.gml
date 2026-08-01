if (string_length(keyboard_string) > 150) {
	keyboard_string = string_copy(keyboard_string, 1, 150);
}
wish_text = keyboard_string;
if (keyboard_check_pressed(vk_enter) && string_length(wish_text) > 0) {
	scr_Wish_Submit();
}