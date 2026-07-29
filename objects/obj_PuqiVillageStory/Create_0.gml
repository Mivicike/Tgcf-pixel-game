arrival_dialogue_waiting = false;
arrival_dialogue_started = false;

hunger_dialogue_waiting = false;
hunger_dialogue_started = false;

if (!scr_SaveData_GetFlag("arrived_puqi", false)) {
	DIALOGUE_MANAGER.start_new_dialogue(global.dialogues.puqi_arrival);
	arrival_dialogue_waiting = true;
}
else if (!scr_SaveData_GetFlag("sanlang_hunger_dialogue_done", false) && instance_exists(obj_SanLang) && !obj_SanLang.sanlang_present) {
	with (obj_SanLang) {
		mode = SANLANG_MODE.FOLLOW;
		visible = true;
		sanlang_present = true;
		x = obj_XieLian.x - 24;
		y = obj_XieLian.y;
	}
	DIALOGUE_MANAGER.start_new_dialogue(global.dialogues.sanlang_hungry);
	hunger_dialogue_waiting = true;
}