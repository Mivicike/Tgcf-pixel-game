function scr_SanLang_UpdateWanderTarget(_center_x, _center_y, _radius) {
    wander_timer -= 1;
    if (wander_timer <= 0) {
        var _angle = random(360);
        var _r = random(_radius);
        wander_target_x = _center_x + lengthdir_x(_r, _angle);
        wander_target_y = _center_y + lengthdir_y(_r, _angle);
        wander_timer = irandom_range(wander_interval_min, wander_interval_max);
    }
}