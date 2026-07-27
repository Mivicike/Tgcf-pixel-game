if (instance_exists(obj_CartDriver)) {
	instance_destroy(obj_CartDriver);
}

if (instance_exists(obj_CartIdle)) {
	instance_destroy(obj_CartIdle);
}

driving_cart = instance_create_depth(210, 170, 0, obj_CartDriving);

obj_CameraManager.fade_in(0.5, 0.1);

cart_scene_step = 1;

audio_play_sound(snd_Carriage, 1, true);