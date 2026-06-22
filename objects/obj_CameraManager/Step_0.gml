// Step Event
if (fade_alpha != fade_target) {
    fade_alpha = lerp(fade_alpha, fade_target, fade_speed);
    if (fade_alpha == fade_target && !is_undefined(fade_done_callback)) {
        fade_done_callback(fade_callback_data);
        fade_done_callback = undefined;
        fade_done_callback_data = undefined;

        fade_state = FADE_STATE.NONE;
    }
}

GAME_CAMERA.update();