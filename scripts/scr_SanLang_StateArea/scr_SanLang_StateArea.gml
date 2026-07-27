function scr_SanLang_StateArea() {
    var _dist_from_anchor = point_distance(x, y, area_anchor_x, area_anchor_y);

    if (_dist_from_anchor > area_radius) {
        wander_timer = 0;
        scr_SanLang_ApplyMovement(area_anchor_x, area_anchor_y, move_speed);
    } else {
        scr_SanLang_UpdateWanderTarget(area_anchor_x, area_anchor_y, area_radius);
        if (point_distance(x, y, wander_target_x, wander_target_y) > 2) {
            scr_SanLang_ApplyMovement(wander_target_x, wander_target_y, move_speed * 0.5);
        } else {
            state = SANLANG_STATE.IDLE;
        }
    }
}