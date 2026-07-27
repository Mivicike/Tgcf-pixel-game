if (instance_number(obj_SanLang) >= 2) {
    instance_destroy();
    exit;
}

event_inherited();

persistent = true;

enum SANLANG_MODE {
    FOLLOW,
    AREA
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


dialogue = scr_SanLang_GetRoomDialogue(room);

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