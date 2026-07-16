function scr_GetValidScrapPosition() {
	var _tries = 100;
	for (var i = 0; i < _tries; i++) {
		var _x = irandom_range(0, room_width);
		var _y = irandom_range(0, room_height);

		if (!collision_circle(_x, _y, 20, obj_SmallCollision, false, true)) {
			return [_x, _y];
		}
	}
}