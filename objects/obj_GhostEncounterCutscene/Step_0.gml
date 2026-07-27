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

        if (current_msg >= array_length(messages)) {
            var _data = {
                room : target_room,
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
				instance_destroy();
				} else {
					text_fade_state = 1;
		}
	}
}