enum EnemyState{
	FREE,
	ATTACK
}

state = EnemyState.FREE

hp = 10;
damage = 1;
distance_to_player = 30;
move_speed = 0.5;
idle_timer = 0;
target_x = x;
target_y = y;

alarm[0] = 60;

// Knockback
kb_x = 1;
kb_y = 1;
knockback_speed = 1;
kb_timer = 0;

facing = 1;