story_step = 0;

if (!scr_SaveData_GetFlag("puqi_arrived", false)) {
	instance_destroy();
	exit;
}

if (scr_SaveData_GetFlag("sanlang_quest_active", false) || scr_SaveData_GetFlag("sanlang_fed", false)) {
	instance_destroy();
	exit;
}

DIALOGUE_MANAGER.start_new_dialogue(global.dialogues.sanlang_hungry);
story_step = 1;