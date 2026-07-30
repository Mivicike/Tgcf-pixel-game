if (!instance_exists(Obj_Inventory)) {
	global.kitchen_mode = true;
	instance_create_depth(0, 0, -9999, Obj_Inventory);
	audio_play_sound(snd_MenuOpen, 1, false);
}