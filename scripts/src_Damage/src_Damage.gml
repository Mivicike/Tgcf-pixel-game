/// @function scr_damage(target, damage_amount, attacker)
/// @description Applies damage to a target instance.
/// @param {instance} target        The instance being damaged
/// @param {real} damage_amount     How much damage to apply
/// @param {instance} attacker      The instance causing the damage

function scr_Damage(_target, _amount, _attacker) {
    
    // Safety checks
    if (!instance_exists(_target)) return;
    if (_amount <= 0) return;
    if (!variable_instance_exists(_target, "hp")) return; // target must have hp
	show_debug_message(_target.hp, _amount)

    // Ignore if already dead
    if (_target.hp <= 0) return;

    // --- Apply damage ---
    _target.hp -= _amount;

    // --- Knockback (optional) ---
    if (variable_instance_exists(_target, "knockback_speed")) {
        var dir = point_direction(_attacker.x, _attacker.y, _target.x, _target.y);
        _target.hspeed = lengthdir_x(_target.knockback_speed, dir);
        _target.vspeed = lengthdir_y(_target.knockback_speed, dir);
    }
	
	show_debug_message(_target.hp, _amount)

    // --- Flash effect or hit animation ---
    //if (is_undefined(_target.hit_flash_time)) _target.hit_flash_time = 0;
    //_target.hit_flash_time = room_speed * 0.2; // 0.2 seconds flash
    // --- Death check ---
    if (_target.hp <= 0) {
		_target.image_blend = c_red;
		instance_destroy(_target);
    }
}