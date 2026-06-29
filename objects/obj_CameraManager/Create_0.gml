scr_CameraConfig();

global.new_camera = new CameraController(obj_XieLian, 420, 280);
#macro GAME_CAMERA global.new_camera
persistent = true;

GAME_CAMERA.reset_all();


// Create Event
enum FADE_STATE {
    NONE,
    FADING_IN,
    FADING_OUT
}

fade_surface = -1;
default_fade_time = .75;
fade_alpha  = 0;
fade_time  = 0;
fade_delay = 0;
fade_timer =  0;
fade_target = 0;
fade_done_callback = undefined;
fade_callback_data = undefined;
fade_state = FADE_STATE.NONE;

/// @description Fade the camera out over a given time, then call a callback function
/// @param {Real} _time The time in seconds to fade out over
/// @param {Function} _callback The function to call when the fade out is complete
/// @param {Any} _data The data to pass to the callback function
/// @param {Real} _delay The time in seconds to wait before starting the fade out
function fade_out(_time, _callback, _data, _delay = 0) {
    with (obj_CameraManager) {
        show_debug_message($"Triggering fade out with time: {_time}, delay: {_delay}, and callback: {_callback}");
        fade_state = FADE_STATE.FADING_OUT;
        fade_time = _time;
        fade_timer = 0;
        fade_target = 1;
        fade_done_callback = _callback;
        fade_callback_data = _data;
        fade_delay = 0;
    }
}

/// @description Fade the camera in over a given time
/// @param {Real} _time The time in seconds to fade in over
/// @param {Real} _delay The time in seconds to wait before starting the fade in
function fade_in(_time, _delay = 0) {
    with (obj_CameraManager) {
        show_debug_message($"Triggering fade in with time: {_time} and delay: {_delay}");
        fade_state = FADE_STATE.FADING_IN;
        fade_time  = _time;
        fade_timer = 0;
        fade_delay = _delay;
        fade_target = 0;
        fade_done_callback = undefined;
        fade_callback_data = undefined;
    }
}
