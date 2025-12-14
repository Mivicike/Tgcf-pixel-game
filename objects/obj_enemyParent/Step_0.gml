if (kb_timer > 0) {
    // Apply knockback
    x += kb_x * knockback_speed;
    y += kb_y * knockback_speed;

    // Decrease timer
    kb_timer -= 1;

    // Optional: stop knockback exactly when timer ends
    if (kb_timer <= 0) {
        kb_x = 0;
        kb_y = 0;
    }
} else {
    // Normal movement logic here
    _hor = target_x - x;
    _ver = target_y - y;
    distance = point_distance(x, y, target_x, target_y);
    if (distance != 0 and hp > 0) {
        _hor /= distance;
        _ver /= distance;
        x += _hor * move_speed;
        y += _ver * move_speed;
    }
}

if (alarm[2] == 0) {
    // Destroy the instance after the alarm goes off
    instance_destroy();
}
