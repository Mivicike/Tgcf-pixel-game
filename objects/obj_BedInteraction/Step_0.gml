depth = -bbox_bottom;
if (scr_SaveData_GetFlag("hualian_bed_scene_done", false)) {
	instance_destroy();
	exit;
}
if (!scr_SaveData_GetFlag("sanlang_fed", false)) {
	show_prompt = false;
	visible = false;
	exit;
}
if (!instance_exists(obj_XieLian)) exit;
var _player_busy = obj_XieLian.movement_locked || DIALOGUE_MANAGER.is_dialogue_active() || instance_exists(obj_HelpPopup);
var _dist = point_distance(x, y, obj_XieLian.x, obj_XieLian.y);
var _was_interactable = show_prompt;
show_prompt = (_dist <= prompt_distance) && !_player_busy;
visible = show_prompt;
if (show_prompt && !_was_interactable) {
	audio_play_sound(snd_Bought, 1, false);
}
if (show_prompt && keyboard_check_pressed(ord("Z")) && !global.z_interaction_used) {
	global.z_interaction_used = true;
	instance_create_depth(0, 0, -20000, obj_HuaLianBedScene);
	instance_destroy();
}