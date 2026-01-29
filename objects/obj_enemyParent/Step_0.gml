var move_x = 0;
var move_y = 0;

if (kb_timer > 0) {

    move_x = kb_x * knockback_speed;
    move_y = kb_y * knockback_speed;

    kb_timer -= 1;

    if (kb_timer <= 0) {
        kb_x = 0;
        kb_y = 0;
    }

} else {

    _hor = target_x - x;
    _ver = target_y - y;
    distance = point_distance(x, y, target_x, target_y);

    if (distance != 0 && hp > 0) {
        _hor /= distance;
        _ver /= distance;

        move_x = _hor * move_speed;
        move_y = _ver * move_speed;
    }
}

// Apply movement ONCE
x += move_x;
y += move_y;



var currentName = scr_ExtractName(id);
var baseName = string_copy(currentName, 1, string_length(currentName) - 1);
var baseIndex = -1;

// Small threshold to ignore micro movement
var deadzone = 0.1;

if (abs(move_x) > deadzone || abs(move_y) > deadzone) {

    if (abs(move_x) > abs(move_y)) {

        if (move_x > 0) {
            baseIndex = asset_get_index(baseName + "tWalking_Right");
        } else {
            baseIndex = asset_get_index(baseName + "tWalking_Left");
        }

    }

    if (baseIndex != -1) {
        sprite_index = baseIndex;
    }
}



if (alarm[2] == 0) {
    // Destroy the instance after the alarm goes off
    instance_destroy();
}
