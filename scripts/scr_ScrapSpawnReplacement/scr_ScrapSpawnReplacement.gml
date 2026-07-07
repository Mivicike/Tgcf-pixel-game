function scr_ScrapSpawnReplacement(_room) {
	if (scr_ScrapMaxForRoom(_room) <= 0) exit; 

	var _pos = scr_GetValidScrapPosition();
	if (_pos == undefined) exit;

	instance_create_depth(_pos[0], _pos[1], 0, obj_ScrapGlitter);
}