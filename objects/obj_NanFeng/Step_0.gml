if (!present) {
	can_talk = false;
	exit;
}
event_inherited();
if (DIALOGUE_MANAGER.dialogue == dialogue) {
	dialogue_was_active = true;
}
if (dialogue_was_active && !DIALOGUE_MANAGER.is_dialogue_active()) {
	dialogue_was_active = false;
	if (!scr_SaveData_GetFlag("nanfeng_ghost_report_given", false)) {
		scr_SaveData_SetFlag("nanfeng_ghost_report_given", true);
		instance_create_depth(397, 727, 0, Obj_LanternSeller);
	}
}