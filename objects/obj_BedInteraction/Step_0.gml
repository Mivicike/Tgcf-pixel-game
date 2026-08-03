depth = -bbox_bottom;
if (scr_SaveData_GetFlag("hualian_bed_scene_done", false)) {
	instance_destroy();
	exit;
}
if (!scr_SaveData_GetFlag("sanlang_fed", false)) {
	visible = false;
	can_interact = false;
	exit;
}
if (!was_unlocked) {
	was_unlocked = true;
	visible = true;
	audio_play_sound(snd_Bought, 1, false);
}
if (!instance_exists(obj_XieLian)) exit;
var _player_busy = obj_XieLian.movement_locked || DIALOGUE_MANAGER.is_dialogue_active() || instance_exists(obj_HelpPopup) || global.holding_hands;
var _dist = point_distance(x, y, obj_XieLian.x, obj_XieLian.y);
can_interact = (_dist <= prompt_distance) && !_player_busy;
if (can_interact && keyboard_check_pressed(ord("Z")) && !global.z_interaction_used) {
	global.z_interaction_used = true;
	instance_create_depth(0, 0, -20000, obj_HuaLianBedScene);
	instance_destroy();
}