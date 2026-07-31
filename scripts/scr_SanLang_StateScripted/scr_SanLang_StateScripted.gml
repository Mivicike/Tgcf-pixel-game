function scr_SanLang_StateScripted() {
	target_enemy = noone;

	var _dist = point_distance(x, y, scripted_target_x, scripted_target_y);

	if (_dist <= 4) {
		state = SANLANG_STATE.IDLE;

		mode = SANLANG_MODE.AREA;
		area_room = Room_PuqiShrine;
		area_anchor_x = 190;
		area_anchor_y = 258;
		x = area_anchor_x;
		y = area_anchor_y;
		sanlang_present = false;
		visible = false;

		scr_SaveData_SetFlag("puqi_arrived", true);
		scr_SaveData_SetFlag("sanlang_mode", "AREA");
		scr_SaveData_SetFlag("sanlang_area_room", room_get_name(Room_PuqiShrine));
		scr_SaveData_SetFlag("sanlang_x", area_anchor_x);
		scr_SaveData_SetFlag("sanlang_y", area_anchor_y);
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