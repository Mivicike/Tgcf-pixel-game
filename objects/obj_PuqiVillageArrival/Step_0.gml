if (story_step == 1) {
	if (!DIALOGUE_MANAGER.is_dialogue_active()) {
		with (obj_SanLang) {
			mode = SANLANG_MODE.SCRIPTED;
			scripted_target_x = inst_114DA686.x;
			scripted_target_y = inst_114DA686.y;
		}
		instance_destroy();
	}
}