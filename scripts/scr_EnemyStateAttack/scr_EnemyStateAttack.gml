function scr_EnemyStateAttack(){
	// Instantiate attack sprite 
	var currentName = scr_ExtractName(id)

	var baseName = string_copy(currentName, 1, string_length(currentName));
	var name = sprite_get_name(sprite_index);

	// remove spr_
	var pos = string_pos("_", name);
	var result = string_delete(name, 1, pos);

	// remove Idle
	result = string_replace(result, "Idle", "");
	result = string_replace(result, "Shooting_Right", "");
	result = string_replace(result, "Shooting_Left", "");
	result = string_replace(result, "Walking_Right", "");
	result = string_replace(result, "Walking_Left", "");

	var baseIndex = baseName + "Shooting";
	show_debug_message("obj_" + result+"_attack_right")
	var _inst = pointer_null;
	
	if (facing == 1) {
		_inst = instance_create_depth(x,y,depth,asset_get_index("obj_" + result+"_attack_right"));
		sprite_index = asset_get_index(baseIndex + "_Right");
		_inst.damage *= damage;
	} else {
		_inst = instance_create_depth(x,y,depth,asset_get_index("obj_" + result + "_attack_left"));
		sprite_index = asset_get_index(baseIndex + "_Right");
		_inst.damage *= damage;
	}
	
	
	
	// Free State Change
	var _player = instance_nearest(x, y, obj_XieLian);
	
	if (instance_exists(_player)) {
	    var distance_to_target = point_distance(x, y, _player.x, _player.y);
		show_debug_message(distance_to_target)

	    if (distance_to_target > 20) {
	        state = EnemyState.FREE;
	    }
	}
}