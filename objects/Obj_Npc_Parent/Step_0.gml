if (instance_exists(obj_Dialogue)) exit;

if (instance_exists(obj_XieLian) && distance_to_object(obj_XieLian) < 8)
{
	can_talk = true;
	if (keyboard_check_pressed(input_key))
	{
		create_dialog(dialog);
	}
}
else
{
	can_talk = false;
}