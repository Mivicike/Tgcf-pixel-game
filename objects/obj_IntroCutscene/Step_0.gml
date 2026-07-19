if (intro_step == 2) {
    var dt = delta_time / 1000000;
    fade_timer += dt;
    fade_alpha = clamp(fade_timer / fade_duration, 0, 1);

    if (fade_timer >= fade_duration) {
        fade_alpha = 1;
        intro_step = 3;

        GAME_CAMERA.stop_shake();
        audio_stop_sound(snd_Rubling);
        if (instance_exists(obj_XieLian)) {
            obj_XieLian.movement_locked = true;
        }

        cutscene_playing = true;
        cutscene_frame = 0;
        audio_play_sound(snd_falling, 1, false);
    }
}

if (intro_step == 3 && cutscene_playing) {
    cutscene_frame += cutscene_speed;

    if (cutscene_frame >= sprite_get_number(spr_Cutscene_XielianFalling)) {
        cutscene_playing = false;
        intro_step = 4;
        audio_stop_sound(snd_falling);

        room_goto(Room_Beginning);
        obj_XieLian.x = target_x;
        obj_XieLian.y = target_y;
        obj_XieLian.movement_locked = false;
    }
}