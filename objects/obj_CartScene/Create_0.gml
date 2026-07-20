cart_scene_step = 0; 

target_x = 0;
target_y = 0;

if (instance_exists(obj_XieLian)) {
    obj_XieLian.movement_locked = true;
    obj_XieLian.visible = false;
}

var _data = { scene : id };
obj_CameraManager.fade_out(0.5, function(_d) {
    with (_d.scene) {
        event_user(0);
    }
}, _data);

depth = -20000;

driving_cart = noone;

cutscene_frame = 0;
cutscene_duration = 3.5;
cutscene_speed = 0;
cutscene_playing = false;

cutscene_fade_duration = 1;
cutscene_fade_timer = 0;
cutscene_alpha = 0;
dialogue_bg_frame = 0;
dialogue_bg_speed = 0;