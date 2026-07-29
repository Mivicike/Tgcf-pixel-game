function scr_SaveData_GetFlag(_flag_name, _default_value = false) {
	if (!scr_SaveData_CheckSaveDataExists()) return _default_value;
	if (!variable_struct_exists(global.save_data.player, "flags")) {
		global.save_data.player.flags = {};
	}
	if (!variable_struct_exists(global.save_data.player.flags, _flag_name)) {
		global.save_data.player.flags[$ _flag_name] = _default_value;
	}
	return global.save_data.player.flags[$ _flag_name];
}

function scr_SaveData_SetFlag(_flag_name, _value) {
	if (!scr_SaveData_CheckSaveDataExists()) return;
	if (!variable_struct_exists(global.save_data.player, "flags")) {
		global.save_data.player.flags = {};
	}
	global.save_data.player.flags[$ _flag_name] = _value;
	if (variable_global_exists("auto_save") && global.auto_save) {
		scr_SaveData_SavePlayerAndInventory();
	}
}