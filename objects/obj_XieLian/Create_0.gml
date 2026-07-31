debug_enabled = false;

halfview_width = camera_get_view_width(view_camera[0]) / 2;
halfview_height = camera_get_view_height(view_camera[0]) / 2;

image_speed = 0;
save_sprite = spr_XieLian_WalkDown

// Player attack variables
attack_reset_time = 1;
attack_counter = 0;
last_attack_time = 0;

//walk speed horizontal and vertical
hsp = 0;
vsp = 0;
hspd =  0;
vspd = 0;
walk_speed = 1.25;
sprinting = false;
sprint_speed = 1.75;

//dash speed and dash check
dash = false
dash_speed = 4;
dash_dir = 270;
dash_cooldown = 0;

//collision speed
collision_speed = walk_speed + 2;

collision_enemy = undefined;

my_direction = 180

//hurtbox
hurtbox = hurtbox_create(7,14,-10,-21)

hit_by_attack = ds_list_create();

//Attack
attack =  3;
attack_combo = 5;
knockback_speed = 6;
knockback_strength = 1; // Knockback strength of the player's attacks
attack_started = false;

//lock movement
movement_locked = false;

// Knockback
kb_x = 0;
kb_y = 0;
kb_timer = 0;
kb_strength = 1; // Knockback strength of the player when hit by an enemy

// Help and quests
help_hover = false;
quest_hover = false;
quest_slide_amount = 0;

state = PLAYERSTATE.FREE
enum PLAYERSTATE {
	FREE,
	ATTACK,
	DASH,
	DEATH
}

//Life
hp = 10;
liv = hp;

a_timer = 0;
a_hold_time = 120;