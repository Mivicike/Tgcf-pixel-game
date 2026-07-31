story_step = 0;

if (scr_SaveData_GetFlag("puqi_arrived", false)) {
	instance_destroy();
	exit;
}

if (instance_exists(obj_SanLang) && obj_SanLang.mode == SANLANG_MODE.SCRIPTED) {
	instance_destroy();
	exit;
}

DIALOGUE_MANAGER.start_new_dialogue(global.dialogues.puqi_arrival);
story_step = 1;

with (obj_SanLang) {
	mode = SANLANG_MODE.FOLLOW;
	visible = true;
	sanlang_present = true;
	x = obj_XieLian.x - 24;
	y = obj_XieLian.y;
}