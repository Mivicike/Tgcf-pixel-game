if (intro_step == 2) {
    var dt = delta_time / 1000000;
    fade_timer += dt;
    fade_alpha = clamp(fade_timer / fade_duration, 0, 1);

    if (fade_timer >= fade_duration) {
        fade_alpha = 1;
        intro_step = 2.5; 

        GAME_CAMERA.stop_shake();
        audio_stop_sound(snd_Rumbling);
        audio_stop_sound(snd_Fountain);
        if (instance_exists(obj_XieLian)) {
            obj_XieLian.movement_locked = true;
        }
    }
}

if (intro_step == 2.5) {
    var dt = delta_time / 1000000;
    
    if (text_fade_state == 1) {
        text_alpha += dt / text_fade_duration;
        if (text_alpha >= 1) {
            text_alpha = 1;
            text_fade_state = 0;
        }
    } 
    else if (text_fade_state == 0) {
        if (keyboard_check_pressed(ord("Z"))) {
            audio_play_sound(snd_Klick, 1, false);
            text_fade_state = -1;
        }
    } 
    else if (text_fade_state == -1) {
        text_alpha -= dt / text_fade_duration;
        if (text_alpha <= 0) {
            text_alpha = 0;
            current_msg++;
            
           if (current_msg >= array_length(intro_messages)) {
                intro_step = 3;
                cutscene_playing = true;
                cutscene_frame = 0;
                audio_play_sound(snd_falling, 1, false);
                
                fade_timer = 0;
                fade_duration = 0.7; 
                fade_alpha = 1; 
                cutscene_alpha = 0;
            } else {
                text_fade_state = 1;
            }
        }
    }
}
if (intro_step == 3) {
    var dt = delta_time / 1000000;
    fade_timer += dt;
    cutscene_alpha = clamp(fade_timer / fade_duration, 0, 1);
    
		if (cutscene_playing) {
		cutscene_frame += cutscene_speed;

		if (cutscene_frame >= sprite_get_number(spr_Cutscene_XielianFalling)) {
			cutscene_playing = false;
			audio_stop_sound(snd_falling);
			intro_step = 4;
			illustration_alpha = 0;
			illustration_timer = 0;
		}
	}
}
if (intro_step == 4) {
    var dt = delta_time / 1000000;
    illustration_timer += dt;
    illustration_alpha = clamp(illustration_timer / illustration_fade_duration, 0, 1);

    if (illustration_timer >= illustration_fade_duration) {
        illustration_alpha = 1;
        intro_step = 5;
        DIALOGUE_MANAGER.start_new_dialogue(global.dialogues.xie_lian_fell_dialogue);
    }
}

if (intro_step == 5 && !DIALOGUE_MANAGER.is_dialogue_active()) {
    intro_step = 6;

    room_goto(Room_Beginning);
    obj_XieLian.x = target_x;
    obj_XieLian.y = target_y;
    obj_XieLian.movement_locked = false;
}