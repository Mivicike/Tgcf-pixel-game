if (story_step == 1) {
	if (!DIALOGUE_MANAGER.is_dialogue_active()) {
		scr_SaveData_SetFlag("sanlang_quest_active", true);
		instance_destroy();
	}
}