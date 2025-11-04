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
	
	show_debug_message(_target.hp, _amount)
	_target.image_blend = c_red;
	_target.alarm[1] = 20;
	
	_target.kb_x = sign(_target.x - _attacker.x)
	_target.kb_y = sign(_target.y - _attacker.y)
	_target.kb_timer = 15;
	
    // --- Death check ---
    if (_target.hp <= 0) {
		_target.image_blend = c_red;
		instance_destroy(_target);
    }
}