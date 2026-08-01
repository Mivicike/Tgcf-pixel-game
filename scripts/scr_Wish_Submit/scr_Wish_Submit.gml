function scr_Wish_Submit() {
	if (string_length(obj_WishTextInput.wish_text) <= 0) exit;
	show_debug_message("Wish made: " + obj_WishTextInput.wish_text);
	instance_destroy(obj_WishTextInput);
}