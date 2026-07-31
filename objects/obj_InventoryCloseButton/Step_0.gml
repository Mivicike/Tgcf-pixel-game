if (instance_exists(obj_HelpPopup)) {
	hover = false;
	exit;
}
if (!instance_exists(Obj_Inventory)) {
	hover = false;
	exit;
}

var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);

var w = sprite_width * img_scale_x;
var h = sprite_height * img_scale_y;
hover = point_in_rectangle(mx, my, x - w/2, y - h/2, x + w/2, y + h/2);

if (hover && mouse_check_button_pressed(mb_left)) {
	event_user(0);
}