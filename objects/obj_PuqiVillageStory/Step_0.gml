if (arrival_dialogue_waiting) {
	if (DIALOGUE_MANAGER.is_dialogue_active()) {
		arrival_dialogue_started = true;
	}
	if (arrival_dialogue_started && !DIALOGUE_MANAGER.is_dialogue_active()) {
		arrival_dialogue_waiting = false;
		scr_SaveData_SetFlag("arrived_puqi", true);

		if (instance_exists(obj_SanLang) && instance_exists(inst_114DA686)) {
			obj_SanLang.mode = SANLANG_MODE.SCRIPTED;
			obj_SanLang.scripted_target_x = inst_114DA686.x;
			obj_SanLang.scripted_target_y = inst_114DA686.y;
		}
	}
}

if (hunger_dialogue_waiting) {
	if (DIALOGUE_MANAGER.is_dialogue_active()) {
		hunger_dialogue_started = true;
	}
	if (hunger_dialogue_started && !DIALOGUE_MANAGER.is_dialogue_active()) {
		hunger_dialogue_waiting = false;
		scr_SaveData_SetFlag("sanlang_hunger_dialogue_done", true);
	}
}