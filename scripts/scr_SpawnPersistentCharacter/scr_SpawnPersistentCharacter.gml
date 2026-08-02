function scr_SpawnPersistentCharacter(_obj, _target_room, _target_x, _target_y) {
	var _inst = instance_create_depth(0, 0, 0, _obj);
	_inst.persistent = true;
	_inst.target_room = _target_room;
	_inst.target_x = _target_x;
	_inst.target_y = _target_y;
	_inst.present = (room == _target_room);
	_inst.visible = _inst.present;
	if (_inst.present) {
		_inst.x = _target_x;
		_inst.y = _target_y;
	}
	return _inst;
}