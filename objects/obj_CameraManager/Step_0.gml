// Step Event
GAME_CAMERA.update();

if (fade_state != FADE_STATE.NONE) {
    var dt = delta_time / 1000000; // Convert microseconds to seconds
    if (fade_delay > 0) {
        fade_delay -= dt;
        return;
    }

    fade_timer += dt;
    var new_fade_percentage = fade_timer / fade_time;
    fade_alpha = fade_target == 1 ? new_fade_percentage : 1 - new_fade_percentage;
    show_debug_message($"Fade Alpha: {fade_alpha}, Target: {fade_target}, Timer: {fade_timer}, Time: {fade_time}");
    if (new_fade_percentage >= 1) {
        fade_alpha = fade_target;
        fade_state = FADE_STATE.NONE;
        fade_timer = 0;

        if (!is_undefined(fade_done_callback)) {
            fade_done_callback(fade_callback_data);
            fade_done_callback = undefined;
            fade_done_callback_data = undefined;
        }
    }
}