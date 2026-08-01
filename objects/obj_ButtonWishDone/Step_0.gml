hover = scr_IsMouseOverGUI(x - sprite_width*img_scale_x/2, y - sprite_height*img_scale_y/2, sprite_width*img_scale_x, sprite_height*img_scale_y);
if (hover && mouse_check_button_pressed(mb_left)) {
	event_user(0);
}
if (instance_exists(obj_WishTextInput) && !variable_instance_exists(id, "owner_popup")) {
	hover = false;
	exit;
}