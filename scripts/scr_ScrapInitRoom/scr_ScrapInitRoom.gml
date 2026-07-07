function scr_ScrapInitRoom(_room) {
	var _max = scr_ScrapMaxForRoom(_room);
	if (_max <= 0) exit;

	for (var i = 0; i < _max; i++) {
		var _pos = scr_GetValidScrapPosition();
		if (_pos == undefined) continue;
		instance_create_depth(_pos[0], _pos[1], 0, obj_ScrapGlitter);
	}
}