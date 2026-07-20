GAME_CAMERA.stop_shake();
audio_stop_sound(snd_Rumbling);
audio_stop_sound(snd_Fountain);

if (instance_exists(obj_XieLian)) {
    obj_XieLian.movement_locked = true;
}

intro_step = 3;
cutscene_playing = true;
cutscene_frame = 0;

audio_play_sound(snd_falling, 1, false);