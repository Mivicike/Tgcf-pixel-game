if (instance_number(obj_SanLang) >= 2) {
    instance_destroy();
    exit;
}

event_inherited();
if (scr_SaveData_GetFlag("sanlang_gone", false)) {
	instance_destroy();
	exit;
}
persistent = true;

enum SANLANG_MODE {
	FOLLOW,
	AREA,
	SCRIPTED
}

enum SANLANG_STATE {
    IDLE,
    WALK,
	ATTACK
}

mode  = SANLANG_MODE.FOLLOW;
state = SANLANG_STATE.IDLE;

facing    = 1;
moving_up = false;

is_attacking   = false;
movement_locked = false;

follow_target = obj_XieLian;
follow_leash_distance = 120;
follow_catchup_distance = 60;
follow_comfortable_distance = 24;
move_speed = 0.9;

wander_timer   = 0;
wander_interval_min = 90;
wander_interval_max = 240;
wander_target_x = x;
wander_target_y = y;
wander_radius   = 24;

scripted_target_x = x;
scripted_target_y = y;

area_anchor_x = x;
area_anchor_y = y;
area_radius   = 80;


target_enemy = noone;
aggro_range = 140;
attack_range = 24;
attack_cooldown = 100;
attack_cooldown_timer = 0;
attack_damage = 1;
attack_windup = 20;
attack_timer = 0;
knockback_strength = 1;

pose_accum_x = 0;
pose_accum_y = 0;
pose_lock_timer = 0;
pose_lock_duration = 12;

sanlang_present = true;
area_room = room;
var _saved_mode = scr_SaveData_GetFlag("sanlang_mode", "FOLLOW");

if (_saved_mode == "AREA") {
	mode = SANLANG_MODE.AREA;

	var _room_name = scr_SaveData_GetFlag("sanlang_area_room", "");
	area_room = (_room_name != "") ? asset_get_index(_room_name) : room;

	area_anchor_x = scr_SaveData_GetFlag("sanlang_x", x);
	area_anchor_y = scr_SaveData_GetFlag("sanlang_y", y);
	x = area_anchor_x;
	y = area_anchor_y;

	sanlang_present = (room == area_room);
	visible = sanlang_present;
} else {
	mode = SANLANG_MODE.FOLLOW;
}