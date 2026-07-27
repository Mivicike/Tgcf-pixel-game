function scr_SanLang_StateFollow() {
    if (!instance_exists(follow_target)) exit;

    var _dist = point_distance(x, y, follow_target.x, follow_target.y);
    var _player_moving = (follow_target.x != follow_target.xprevious)
                       || (follow_target.y != follow_target.yprevious);

    if (_player_moving) {
 
        wander_timer = 0;
        scr_SanLang_ApplyMovement(follow_target.x, follow_target.y, move_speed);
    }
    else if (_dist > follow_comfortable_distance) {
        scr_SanLang_ApplyMovement(follow_target.x, follow_target.y, move_speed);
    }
    else {
        scr_SanLang_UpdateWanderTarget(follow_target.x, follow_target.y, wander_radius);
        if (point_distance(x, y, wander_target_x, wander_target_y) > 2) {
            scr_SanLang_ApplyMovement(wander_target_x, wander_target_y, move_speed * 0.5);
        } else {
            state = SANLANG_STATE.IDLE;
        }
    }
}