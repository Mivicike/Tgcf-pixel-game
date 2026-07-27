if (keyboard_check_pressed(vk_down)) {
	selected_index = (selected_index + 1) mod array_length(options);
}
if (keyboard_check_pressed(vk_up)) {
	selected_index = (selected_index - 1 + array_length(options)) mod array_length(options);
}

var _mx = device_mouse_x_to_gui(0);
var _my = device_mouse_y_to_gui(0);
for (var i = 0; i < array_length(options); i++) {
	var _y = panel_y + i * option_spacing;
	if (point_in_rectangle(_mx, _my, panel_x, _y - option_spacing/2, panel_x + 420, _y + option_spacing/2)) {
		selected_index = i;
		if (mouse_check_button_pressed(mb_left)) {
			scr_SanLang_ChoiceMenu_Confirm();
			exit;
		}
	}
}

if (keyboard_check_pressed(ord("Z")) && !global.z_interaction_used) {
	global.z_interaction_used = true;
	scr_SanLang_ChoiceMenu_Confirm();
}

if (keyboard_check_pressed(vk_escape)) {
	instance_destroy();
}