if (instance_exists(obj_HelpPopup)) {
	hover = false;
	exit;
}
hover = scr_IsMouseOverGUI(x - sprite_xoffset, y - sprite_yoffset, sprite_width, sprite_height);
if (hover && mouse_check_button_pressed(mb_left))
{
    event_user(0);
}