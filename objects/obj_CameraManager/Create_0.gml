scr_CameraConfig();

global.new_camera = new CameraController(obj_XieLian, 480, 280);
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
default_fade_speed = 0.3;
fade_alpha  = 0;
fade_speed  = 0;
fade_target = 0;
fade_done_callback = undefined;
fade_callback_data = undefined;
fade_state = FADE_STATE.NONE;

function fade_out(speed, callback, data) {
    with (obj_CameraManager) {
        fade_state = FADE_STATE.FADING_OUT;
        fade_speed = speed;
        fade_target = 1;
        fade_done_callback = callback;
        fade_callback_data = data;
    }
}

function fade_in(speed) {
    with (obj_CameraManager) {
        fade_state = FADE_STATE.FADING_IN;
        fade_speed  = speed;
        fade_target = 0;
        fade_done_callback = undefined;
        fade_callback_data = undefined;
    }
}