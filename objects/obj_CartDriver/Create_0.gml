event_inherited();
if (scr_SaveData_GetFlag("puqi_cart_departed", false)) {
	instance_destroy();
	exit;
}
dialogue = global.dialogues.CartDriver1;
dialogue_was_active = false;