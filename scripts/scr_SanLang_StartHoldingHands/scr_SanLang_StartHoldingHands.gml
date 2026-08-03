function scr_SanLang_StartHoldingHands() {
	global.holding_hands = true;
	if (instance_exists(obj_XieLian)) {
		obj_XieLian.movement_locked = false;
		obj_XieLian.dash = false;
		obj_XieLian.state = PLAYERSTATE.HOLDING_HANDS;
		obj_XieLian.hold_hand_facing = "Down";
		obj_XieLian.sprite_index = spr_HoldHandIdle_Down;
		obj_XieLian.image_index = 0;
		obj_XieLian.image_speed = 0;
	}
	if (instance_exists(obj_SanLang)) {
		instance_destroy(obj_SanLang);
	}
}