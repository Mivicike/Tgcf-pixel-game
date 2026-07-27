function scr_SanLang_UpdateCombat() {
    if (attack_cooldown_timer > 0) attack_cooldown_timer -= 1;

    if (target_enemy == noone && instance_exists(obj_XieLian)) {
        var _nearest = instance_nearest(obj_XieLian.x, obj_XieLian.y, obj_enemyParent);
        if (_nearest != noone && _nearest.hp > 0) {
            var _dist_to_player = point_distance(obj_XieLian.x, obj_XieLian.y, _nearest.x, _nearest.y);
            if (_dist_to_player <= aggro_range) {
                target_enemy = _nearest;
            }
        }
    }
}