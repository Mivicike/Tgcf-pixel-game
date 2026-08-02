var dt = delta_time / 1000000;
switch (story_step) {
	case 0:
		fade_timer += dt;
		fade_alpha = clamp(fade_timer / fade_duration, 0, 1);
		if (fade_timer >= fade_duration) {
			fade_alpha = 1;
			story_step = 1;
			hold_timer = 0;
		}
		break;
	case 1:
		hold_timer += dt;
		if (hold_timer >= hold_duration) {
			story_step = 2;
			sprite2_timer = 0;
		}
		break;
	case 2:
		sprite2_timer += dt;
		if (sprite2_timer >= sprite2_duration) {
			story_step = 2.5;
			crossfade_out_timer = 0;
			fade_alpha = 1;
		}
		break;
	case 2.5:
		crossfade_out_timer += dt;
		fade_alpha = clamp(1 - (crossfade_out_timer / crossfade_out_duration), 0, 1);
		if (crossfade_out_timer >= crossfade_out_duration) {
			fade_alpha = 0;
			story_step = 2.75;
			crossfade_in_timer = 0;
		}
		break;
	case 2.75:
		crossfade_in_timer += dt;
		sprite3_alpha = clamp(crossfade_in_timer / crossfade_in_duration, 0, 1);
		if (crossfade_in_timer >= crossfade_in_duration) {
			sprite3_alpha = 1;
			story_step = 3;
			DIALOGUE_MANAGER.start_new_dialogue(global.dialogues.hualian_bed_scene);
		}
		break;
	case 3:
		if (!DIALOGUE_MANAGER.is_dialogue_active()) {
			scr_HuaLianBedScene_Complete();
		}
		break;
}