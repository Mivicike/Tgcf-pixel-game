event_inherited();
dialogue = global.dialogues.lantern_seller_dialogue;
if (!scr_SaveData_GetFlag("nanfeng_ghost_report_given", false)) {
	instance_destroy();
	exit;
}