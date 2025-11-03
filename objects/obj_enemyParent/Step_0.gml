var _hor = target_x - x;
var _ver = target_y - y;

var distance = point_distance(x, y, target_x, target_y);

// Normalize the direction
_hor /= distance;
_ver /= distance;

// Apply knockback if it's active
if (kb_x != 0 || kb_y != 0) {
    move_and_collide(kb_x * knockback_speed, kb_y * knockback_speed, [obj_enemyParent]);
    kb_x = 0;
    kb_y = 0;  // Reset after applying knockback
} else {
    // Move the enemy towards the player or random position
    move_and_collide(_hor * move_speed, _ver * move_speed, [obj_enemyParent]);
}
