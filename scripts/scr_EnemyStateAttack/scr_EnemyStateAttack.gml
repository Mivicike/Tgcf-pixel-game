function scr_EnemyStateAttack(){
	// Instantiate attack sprite 
	var _inst = pointer_null;
	var currentName = scr_ExtractName(id);
	if (string_pos("left",currentName)) {
		_inst = instance_create_depth(x,y,depth,obj_enemy_attack);
		_inst.image_angle = point_direction(0, 0, _hor, _ver);
		_inst.damage *= damage;
	} else {
	
	}
}