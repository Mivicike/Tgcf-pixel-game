gui_w = display_get_gui_width();
gui_h = display_get_gui_height();

options = [];

if (scr_SaveData_GetFlag("sanlang_quest_active", false) && !scr_SaveData_GetFlag("sanlang_fed", false)) {
	array_push(options, "Feed San Lang");
} else {
	if (obj_SanLang.mode == SANLANG_MODE.AREA) {
		array_push(options, "Follow me");
	}
	array_push(options, "Do you want to see this new thing I bought?");
	array_push(options, "What are you up to?");
	if (obj_SanLang.mode == SANLANG_MODE.FOLLOW) {
		array_push(options, "You don't have to follow me anymore");
	}
}

selected_index = 0;
option_spacing = 30;
panel_x = 20;
panel_y = gui_h - (array_length(options) * option_spacing) - 80;