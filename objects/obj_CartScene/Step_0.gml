if (cart_scene_step == 1 && instance_exists(driving_cart)) {
    if (driving_cart.x <= -198) {
        driving_cart.move_speed = 0;

        cart_scene_step = 2;
        cutscene_playing = true;
        cutscene_frame = 0;
        cutscene_fade_timer = 0;
        cutscene_alpha = 0;
        cutscene_speed = sprite_get_number(spr_Cutscene_Cart) / (cutscene_duration * room_speed);
    }
}

if (cart_scene_step == 2 && cutscene_playing) {
    var dt = delta_time / 1000000;

    if (cutscene_alpha < 1) {
        cutscene_fade_timer += dt;
        cutscene_alpha = clamp(cutscene_fade_timer / cutscene_fade_duration, 0, 1);
    }

    cutscene_frame += cutscene_speed;

  if (cutscene_frame >= sprite_get_number(spr_Cutscene_Cart)) {
        cutscene_playing = false;
        cart_scene_step = 3;

        dialogue_bg_frame = 0;
        var _dtype = sprite_get_speed_type(spr_Cutscene_Cart_Dialogue);
        var _dspd  = sprite_get_speed(spr_Cutscene_Cart_Dialogue);
        dialogue_bg_speed = (_dtype == spritespeed_framespersecond) ? (_dspd / room_speed) : _dspd;

        DIALOGUE_MANAGER.start_new_dialogue(global.dialogues.cart_hualian);
    }
}

if (cart_scene_step == 3 && !DIALOGUE_MANAGER.is_dialogue_active()) {
    cart_scene_step = 4;

    var _data = {
        room : Room_GhostEncounter,
        x    : target_x,
        y    : target_y
    };

    obj_CameraManager.fade_out(0.5, function(_d) {
        room_goto(_d.room);
        obj_XieLian.x = _d.x;
        obj_XieLian.y = _d.y;
        obj_XieLian.visible = true;
        obj_XieLian.movement_locked = false;
    }, _data);
}
if (cart_scene_step == 3) {
    dialogue_bg_frame += dialogue_bg_speed;
    var _num = sprite_get_number(spr_Cutscene_Cart_Dialogue);
    if (dialogue_bg_frame >= _num) {
        dialogue_bg_frame -= _num; // loop back to the start
    }
}