var in_range = instance_exists(obj_XieLian) && distance_to_object(obj_XieLian) < 8;
can_talk = false;
if (in_range && DIALOGUE_MANAGER.can_dialogue_start())
{
    can_talk = true;
	if (keyboard_check_pressed(input_key))
	{
		DIALOGUE_MANAGER.start_new_dialogue(dialogue);
	}
}