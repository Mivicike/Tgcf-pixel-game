if (sound_played_for != current_message) {
	sound_played_for = current_message;

	var _line_sound = messages[current_message][$ "sound"];
	if (!is_undefined(_line_sound)) {
		audio_play_sound(_line_sound, 1, false);
		}
}

if (current_message < 0)
	exit;

var _str = messages[current_message].msg;

if (current_char < string_length(_str))
{
	current_char += char_speed * (1 + real(keyboard_check(input_key)));
	draw_message = string_copy(_str, 0, current_char);
}
else if (keyboard_check_pressed(input_key))
{
	if (current_message >= array_length(messages) - 1)
	{
		DIALOGUE_MANAGER.complete_dialogue();
	}
	else
	{
		current_message++;
		current_char = 0;
		draw_message = "";
		audio_play_sound(snd_DialogPling, 0, false);
	}
}