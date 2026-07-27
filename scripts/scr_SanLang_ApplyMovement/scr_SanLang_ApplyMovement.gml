function scr_SanLang_ApplyMovement(_tx, _ty, _spd) {
    if (_spd <= 0 || (_tx == x && _ty == y)) {
        state = SANLANG_STATE.IDLE;
        return;
    }

    var _prev_x = x;
    var _prev_y = y;

	mp_potential_step_object(_tx, _ty, _spd, obj_obstacle);

    var _dx = x - _prev_x;
    var _dy = y - _prev_y;

    if (_dx == 0 && _dy == 0) {
        state = SANLANG_STATE.IDLE;
        return;
    }

    state = SANLANG_STATE.WALK;

    pose_accum_x += _dx;
    pose_accum_y += _dy;
    pose_lock_timer -= 1;

    if (pose_lock_timer <= 0) {
        var _fx = pose_accum_x;
        var _fy = pose_accum_y;
        var _margin = 1.3;

        if (abs(_fx) > 0.05) {
            facing = (_fx > 0) ? 1 : -1;
        }

        if (_fy < 0 && abs(_fy) > abs(_fx) * _margin) {
            moving_up = true;
        } else if (abs(_fx) > abs(_fy) * _margin) {
            moving_up = false;
        }

        pose_accum_x = 0;
        pose_accum_y = 0;
        pose_lock_timer = pose_lock_duration;
    }
}