function scr_SanLang_StateCombat() {
    if (target_enemy == noone) exit;

    if (is_attacking) {
        state = SANLANG_STATE.IDLE;
        attack_timer -= 1;
        if (attack_timer <= 0) {
            is_attacking = false;
            if (!instance_exists(target_enemy) || target_enemy.hp <= 0) {
                target_enemy = noone;
            }
        }
        exit;
    }

    if (!instance_exists(target_enemy)) {
        target_enemy = noone;
        exit;
    }

    var _dist = point_distance(x, y, target_enemy.x, target_enemy.y);

    if (_dist > attack_range) {
        scr_SanLang_ApplyMovement(target_enemy.x, target_enemy.y, move_speed);
    } else {
        facing = (target_enemy.x >= x) ? 1 : -1;
        state = SANLANG_STATE.IDLE;

        if (attack_cooldown_timer <= 0) {
            is_attacking = true;
            scr_Damage(target_enemy, attack_damage, self);
            attack_cooldown_timer = attack_cooldown;
            attack_timer = attack_windup;
        }
    }
}