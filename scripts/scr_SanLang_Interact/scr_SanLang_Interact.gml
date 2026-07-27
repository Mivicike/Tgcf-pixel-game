function scr_SanLang_Interact() {
	if (instance_exists(obj_SanLangChoiceMenu)) exit;
	instance_create_depth(0, 0, -10001, obj_SanLangChoiceMenu);
	if (instance_exists(obj_XieLian)) {
		obj_XieLian.movement_locked = true;
	}
}