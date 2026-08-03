depth = -bbox_bottom;

if (!instance_exists(obj_XieLian)) exit;

var _player_busy = obj_XieLian.movement_locked || DIALOGUE_MANAGER.is_dialogue_active() || global.holding_hands;

var _dist = point_distance(x, y, obj_XieLian.x, obj_XieLian.y);
show_prompt = (_dist <= prompt_distance) && !_player_busy;

if (show_prompt && keyboard_check_pressed(ord("Z")) && !global.z_interaction_used) {
	global.z_interaction_used = true;

	var _amount = irandom_range(3, 10);
	global.yuan += _amount;
	audio_play_sound(snd_collected, 1, false);

	var _popup = instance_create_depth(x, y - 20, -9999, obj_FloatingText);
	_popup.text = "+" + string(_amount) + " yuan";
	_popup.color = c_yellow;

	scr_ScrapSpawnReplacement(room);
	instance_destroy();
}