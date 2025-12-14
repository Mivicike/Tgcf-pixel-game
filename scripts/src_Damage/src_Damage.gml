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
	
	// Get the original sprite name
	var sprName = scr_ExtractName(_target)

	// Build the damage version name
	var sprDMG = sprName + "_DMG";

	// Try to find that sprite in the asset tree
	var sprIndexDMG = asset_get_index(sprDMG);


	// When damaged make the enemy red
	_target.image_blend = c_red;
	
	
	_target.alarm[1] = 20;
	
	_target.kb_x = sign(_target.x - _attacker.x)
	_target.kb_y = sign(_target.y - _attacker.y)
	_target.kb_timer = 15;
	var prev_x = _target.x;
	var prev_y = _target.y;
	
    // --- Death check ---
    if (_target.hp <= 0) {
		_target.kb_x = 0
		_target.kb_y = 0
		_target.kb_timer = 0;
		// If the DMG sprite exists, use it
		if (sprIndexDMG != -1) {
			_target.image_blend = c_white;
			_target.image_index = 0;
		    _target.sprite_index = sprIndexDMG;
			_target.x = prev_x;
			_target.y = prev_y;
		} else {
		    // If no _DMG sprite exists, fallback to red tint
		    _target.image_blend = c_red;
		}
		// Use alarm[2] to delay the destruction by 3 seconds
        alarm_set(2, 20);
    }
}