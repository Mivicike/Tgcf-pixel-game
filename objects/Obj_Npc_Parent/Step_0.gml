if (array_length(dialogue_sequence) == 0) {
	dialogue_sequence = [dialogue];
}
var _player_locked = instance_exists(obj_XieLian) && (obj_XieLian.movement_locked || global.holding_hands);
var in_range = !_player_locked && !instance_exists(obj_HelpPopup) && instance_exists(obj_XieLian) && distance_to_object(obj_XieLian) < 12;
can_talk = false;
if (in_range && DIALOGUE_MANAGER.can_dialogue_start())
{
	can_talk = true;
	if (keyboard_check_pressed(input_key) && !global.z_interaction_used)
	{
		global.z_interaction_used = true;
		var _stage_index = min(dialogue_stage, array_length(dialogue_sequence) - 1);
		var _next_dialogue = dialogue_sequence[_stage_index];
		DIALOGUE_MANAGER.start_new_dialogue(_next_dialogue);
	}
}

if (DIALOGUE_MANAGER.dialogue == dialogue_sequence[min(dialogue_stage, array_length(dialogue_sequence) - 1)]) {
	stage_tracking_was_active = true;
}
if (stage_tracking_was_active && !DIALOGUE_MANAGER.is_dialogue_active()) {
	stage_tracking_was_active = false;
	if (dialogue_stage < array_length(dialogue_sequence) - 1) {
		dialogue_stage += 1;
	}
}