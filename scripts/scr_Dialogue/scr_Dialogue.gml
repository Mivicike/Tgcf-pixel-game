function create_dialog(_messages){
	if (instance_exists(Obj_Dialogue)) return;
	
	var _inst = instances_create_depth(0, 0, 0, Obj_Dialogue);
	_inst._messages = _messages;
	_inst.current_message = 0;

}