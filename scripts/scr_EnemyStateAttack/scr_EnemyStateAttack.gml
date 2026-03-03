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
}