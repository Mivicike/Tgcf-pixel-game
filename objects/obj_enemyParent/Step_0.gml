move_x = 0;
move_y = 0;

// Knockback and chasing player logic
if (kb_timer > 0) {
    move_x = kb_x * knockback_speed;
    move_y = kb_y * knockback_speed;
    kb_timer--;
}
else {
    var _hor = target_x - x;
    var _ver = target_y - y;
    var distance = point_distance(x, y, target_x, target_y);

    if (distance > 1 && hp > 0) {
        _hor /= distance;
        _ver /= distance;

        move_x = _hor * move_speed;
        move_y = _ver * move_speed;
    }
}

// Smooth stop / clamp speed 
var max_speed = move_speed;
move_x = clamp(move_x, -max_speed, max_speed);
move_y = clamp(move_y, -max_speed, max_speed);

// Kill tiny values for deadzone 
var deadzone = 0.1;
if (abs(move_x) < deadzone) move_x = 0;
if (abs(move_y) < deadzone) move_y = 0;

x += move_x;
y += move_y;


var currentName = scr_ExtractName(id);
var baseName = string_copy(currentName, 1, string_length(currentName) - 1);

// Idle timer logic 
if (!variable_instance_exists(id, "idle_timer")) {
    idle_timer = 0;
}

if (move_x == 0 && move_y == 0) {
    idle_timer += 1;   
} else {
    idle_timer = 0;    
}

if (idle_timer > 10) { 
    sprite_index = asset_get_index(baseName + "tIdle");
} else {
    if (move_x != 0 || move_y != 0) {
        facing = (move_x > 0) ? 1 : -1;
        sprite_index = asset_get_index(baseName + "tWalking_" + (facing == 1 ? "Right" : "Left"));
    }
}

if (alarm[2] == 0) {
    // Destroy the instance after the alarm goes off
    instance_destroy();
}
