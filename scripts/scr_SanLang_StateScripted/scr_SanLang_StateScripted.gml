function scr_SanLang_StateScripted() {
	target_enemy = noone;

	var _dist = point_distance(x, y, scripted_target_x, scripted_target_y);

	if (_dist <= 4) {
		state = SANLANG_STATE.IDLE;

		mode = SANLANG_MODE.AREA;
		area_room = Room_PuqiShrine;
		area_anchor_x = x;
		area_anchor_y = y;
		sanlang_present = false;
		visible = false;
		exit;
	}

	var _dir = point_direction(x, y, scripted_target_x, scripted_target_y);
	x += lengthdir_x(move_speed, _dir);
	y += lengthdir_y(move_speed, _dir);

	if (abs(scripted_target_x - x) > 0.05) {
		facing = (scripted_target_x > x) ? 1 : -1;
	}
	moving_up = (scripted_target_y < y) && (abs(scripted_target_y - y) > abs(scripted_target_x - x) * 1.3);

	state = SANLANG_STATE.WALK;
}