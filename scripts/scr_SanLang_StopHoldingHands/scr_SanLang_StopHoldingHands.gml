function scr_SanLang_StopHoldingHands() {
	global.holding_hands = false;
	global.z_interaction_used = true;
	if (instance_exists(obj_XieLian)) {
		obj_XieLian.state = PLAYERSTATE.FREE;
		obj_XieLian.sprite_index = spr_XieLian_WalkDown;
		obj_XieLian.image_index = 0;
		obj_XieLian.image_speed = 0;
	}
	if (!instance_exists(obj_SanLang)) {
		var _san_lang = instance_create_depth(0, 0, 0, obj_SanLang);
		_san_lang.mode = SANLANG_MODE.FOLLOW;
		_san_lang.visible = true;
		_san_lang.sanlang_present = true;
		_san_lang.x = obj_XieLian.x - 24;
		_san_lang.y = obj_XieLian.y;
		scr_SaveData_SetFlag("sanlang_mode", "FOLLOW");
	}
}