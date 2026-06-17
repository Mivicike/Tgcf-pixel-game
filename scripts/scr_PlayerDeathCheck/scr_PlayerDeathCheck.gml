function scr_PlayerDeathCheck() {
    with(obj_XieLian) {
        // Debug to kill player for testing
        if (keyboard_check_pressed(ord("K"))) {
            hp = 0;
        }

        if (hp <= 0) {
            // Player had died
            if (state != PLAYERSTATE.DEATH) {
                audio_play_sound(Snd_Dash, 1, false); // Place death sound here
                instance_create_depth(0, 0, -9999, obj_DeathSplash); // Create death splash effect
            }

            state = PLAYERSTATE.DEATH;
        }
    }
}