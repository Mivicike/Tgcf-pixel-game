if (instance_exists(Obj_Dialogue)) exit;

if (instance_exists(obj_XieLian) && distance_to_object(obj_XieLian) < 8)
{
	can_talk = true;
	if (keyboard_check_pressed(input_key))
	{
		create_dialog(dialogue);
	}
}
else
{
	can_talk = false;
}