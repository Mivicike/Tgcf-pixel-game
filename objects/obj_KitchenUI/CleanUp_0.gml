if (instance_exists(open_inventory_button)) instance_destroy(open_inventory_button);
if (instance_exists(exit_button)) instance_destroy(exit_button);

if (instance_exists(obj_XieLian)) {
	obj_XieLian.movement_locked = false;
}
if (instance_exists(done_button)) instance_destroy(done_button);
if (audio_is_playing(snd_Boil)) {
	audio_stop_sound(snd_Boil);
}