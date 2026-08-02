if (instance_exists(obj_XieLian)) {
	obj_XieLian.movement_locked = true;
}
depth = -20000;
story_step = 0;
fade_alpha = 0;
fade_timer = 0;
fade_duration = 3;
hold_timer = 0;
hold_duration = 2;
sprite2_timer = 0;
sprite2_duration = 3;
crossfade_out_timer = 0;
crossfade_out_duration = 1;
crossfade_in_timer = 0;
crossfade_in_duration = 1;
sprite3_alpha = 0;
global.suppress_room_music = true;
audio_stop_sound(Snd_PuqiShrine);