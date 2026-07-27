function scr_SanLang_FindFreeSpot(_start_x, _start_y, _target_x, _target_y) {
    if (!place_meeting(_start_x, _start_y, obj_obstacle)) {
        return [_start_x, _start_y];
    }

    var _dist = point_distance(_start_x, _start_y, _target_x, _target_y);
    var _step_size = 4;
    var _steps = ceil(_dist / _step_size);

    for (var i = 1; i <= _steps; i++) {
        var _t = i / _steps;
        var _check_x = lerp(_start_x, _target_x, _t);
        var _check_y = lerp(_start_y, _target_y, _t);
        if (!place_meeting(_check_x, _check_y, obj_obstacle)) {
            return [_check_x, _check_y];
        }
    }
    return [_target_x, _target_y];
}