var in_range = instance_exists(obj_XieLian) && distance_to_object(obj_XieLian) < 8;
if (in_range && DIALOGUE_MANAGER.can_dialogue_start())
{
	if (keyboard_check_pressed(input_key))
	{
		DIALOGUE_MANAGER.start_new_dialogue(dialogue);
	}
}