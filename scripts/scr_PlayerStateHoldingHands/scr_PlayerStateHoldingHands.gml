function scr_PlayerStateHoldingHands() {
	var _busy = DIALOGUE_MANAGER.is_dialogue_active() || instance_exists(obj_HelpPopup) || instance_exists(Obj_Inventory) || obj_CameraManager.fade_state != FADE_STATE.NONE;
	if (_busy) {
		hsp = 0;
		vsp = 0;
		image_speed = 0;
		exit;
	}
	if (keyboard_check_pressed(ord("Z")) && !global.z_interaction_used) {
		global.z_interaction_used = true;
		scr_SanLang_StopHoldingHands();
		exit;
	}
	right = keyboard_check_direct(vk_right) or keyboard_check_direct(ord("D"));
	left = keyboard_check_direct(vk_left) or keyboard_check_direct(ord("A"));
	up = keyboard_check_direct(vk_up) or keyboard_check_direct(ord("W"));
	down = keyboard_check_direct(vk_down) or keyboard_check_direct(ord("S"));
	directx = right - left;
	directy = up - down;
	if (directx != 0 || directy != 0) {
		var _length = sqrt(directx * directx + directy * directy);
		hsp = (directx / _length) * walk_speed;
		vsp = (directy / _length) * walk_speed;
	} else {
		hsp = 0;
		vsp = 0;
	}
	if (!place_meeting(x + hsp, y, obj_obstacle)) {
		x += hsp;
	}
	if (!place_meeting(x, y - vsp, obj_obstacle)) {
		y -= vsp;
	}
	if (x > xprevious) {
		hold_hand_facing = "Right";
	}
	if (x < xprevious) {
		hold_hand_facing = "Left";
	}
	if (y > yprevious) {
		hold_hand_facing = "Down";
	}
	if (y < yprevious) {
		hold_hand_facing = "Up";
	}
	var _is_idle = (x == xprevious && y == yprevious);
	var _target_sprite = spr_HoldHandIdle_Down;
	if (_is_idle) {
		switch (hold_hand_facing) {
			case "Up":
				_target_sprite = spr_HoldHandIdle_Up;
				break;
			case "Down":
				_target_sprite = spr_HoldHandIdle_Down;
				break;
			case "Left":
				_target_sprite = spr_HoldHandIdle_Left;
				break;
			case "Right":
				_target_sprite = spr_HoldHandIdle_Right;
				break;
		}
	} else {
		switch (hold_hand_facing) {
			case "Up":
				_target_sprite = spr_HoldHand_Up;
				break;
			case "Down":
				_target_sprite = spr_HoldHand_Down;
				break;
			case "Left":
				_target_sprite = spr_HoldHand_Left;
				break;
			case "Right":
				_target_sprite = spr_HoldHand_Right;
				break;
		}
	}
	if (sprite_index != _target_sprite) {
		sprite_index = _target_sprite;
		image_index = 0;
	}
	image_speed = _is_idle ? 1 : walk_speed;
}