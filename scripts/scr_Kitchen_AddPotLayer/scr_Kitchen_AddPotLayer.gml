function scr_Kitchen_AddPotLayer(_layers, _color) {
	var _idx = -1;
	for (var i = 0; i < array_length(_layers); i++) {
		if (_layers[i] == _color) {
			_idx = i;
			break;
		}
	}
	if (_idx != -1) {
		array_delete(_layers, _idx, 1);
	}
	array_push(_layers, _color);
}