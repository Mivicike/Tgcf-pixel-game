function scr_SanLang_Interact() {
	if (instance_exists(obj_SanLangDialogueOptions)) exit;
	instance_create_depth(0, 0, -10001, obj_SanLangDialogueOptions);
	if (instance_exists(obj_XieLian)) {
		obj_XieLian.movement_locked = true;
	}
}