depth = -bbox_bottom;

if (!instance_exists(obj_XieLian)) exit;

var _dist = point_distance(x, y, obj_XieLian.x, obj_XieLian.y);
show_prompt = (_dist <= prompt_distance);

if (show_prompt && keyboard_check_pressed(ord("Z"))) {
	var _amount = irandom_range(5, 12);
	global.kronor += _amount;
	audio_play_sound(snd_collected, 1, false);

	var _popup = instance_create_depth(x, y - 20, -9999, obj_FloatingText);
	_popup.text = "+" + string(_amount) + " kr";
	_popup.color = c_yellow;

	scr_ScrapSpawnReplacement(room);
	instance_destroy();
}