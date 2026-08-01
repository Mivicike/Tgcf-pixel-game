if (story_step == 1) {
	if (!DIALOGUE_MANAGER.is_dialogue_active()) {
		var _cart_x = instance_exists(obj_CartIdle) ? obj_CartIdle.x : 1150;
		var _cart_y = instance_exists(obj_CartIdle) ? obj_CartIdle.y : 250;
		if (instance_exists(obj_CartIdle)) {
			instance_destroy(obj_CartIdle);
		}
		if (instance_exists(obj_CartDriver)) {
			instance_destroy(obj_CartDriver);
		}
		instance_create_depth(_cart_x, _cart_y, 0, obj_CartDriveAway);
		scr_SaveData_SetFlag("puqi_cart_departed", true);
		with (obj_SanLang) {
			mode = SANLANG_MODE.SCRIPTED;
			scripted_target_x = inst_114DA686.x;
			scripted_target_y = inst_114DA686.y;
		}
		instance_destroy();
	}
}