depth = -99999;
if (!instance_exists(obj_XieLian)) {
	visible = false;
	is_present = false;
	exit;
}
var _sanlang_here = instance_exists(obj_SanLang) && obj_SanLang.sanlang_present;
var _cutscene_active = instance_exists(obj_IntroCutscene) || instance_exists(obj_CartScene) || instance_exists(obj_GhostEncounterCutscene) || instance_exists(obj_HuaLianBedScene);
var _should_show = !_sanlang_here && !global.holding_hands && room != Room_HeavenlyCourt && !_cutscene_active;
var _room_changed = (room != last_room);
last_room = room;
if (_should_show && (!is_present || _room_changed)) {
	is_present = true;
	visible = true;
	var _spawn_angle = random(360);
	var _spawn_dist = random_range(min_dist, max_dist);
	x = obj_XieLian.x + lengthdir_x(_spawn_dist, _spawn_angle);
	y = obj_XieLian.y + lengthdir_y(_spawn_dist, _spawn_angle);
	flutter_dir = random(360);
	flutter_timer = irandom_range(20, 60);
} else if (!_should_show) {
	is_present = false;
	visible = false;
}
if (!is_present) exit;
var _dist_to_player = point_distance(x, y, obj_XieLian.x, obj_XieLian.y);
if (_dist_to_player > max_dist * 2) {
	var _snap_angle = random(360);
	var _snap_dist = random_range(min_dist, max_dist);
	x = obj_XieLian.x + lengthdir_x(_snap_dist, _snap_angle);
	y = obj_XieLian.y + lengthdir_y(_snap_dist, _snap_angle);
	flutter_dir = random(360);
	flutter_timer = irandom_range(20, 60);
	exit;
}
flutter_dir += random_range(-12, 12);
flutter_timer -= 1;
if (flutter_timer <= 0) {
	flutter_dir += random_range(-90, 90);
	flutter_timer = irandom_range(20, 60);
}
var _current_speed = move_speed;
if (_dist_to_player > max_dist) {
	var _dir_to_player = point_direction(x, y, obj_XieLian.x, obj_XieLian.y);
	flutter_dir = _dir_to_player + random_range(-15, 15);
	_current_speed = chase_speed;
} else if (_dist_to_player < min_dist) {
	var _dir_away = point_direction(obj_XieLian.x, obj_XieLian.y, x, y);
	flutter_dir += clamp(angle_difference(_dir_away, flutter_dir), -6, 6);
}
x += lengthdir_x(_current_speed, flutter_dir);
y += lengthdir_y(_current_speed, flutter_dir);