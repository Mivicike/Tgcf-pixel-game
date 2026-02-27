enum EnemyState{
	FREE,
	ATTACK
}

state = EnemyState.FREE

hp = 20;
damage = 1;
distance_to_player = 90;
move_speed = 0.5;

target_x = x;
target_y = y;

alarm[0] = 60;

// Knockback
kb_x = 1;
kb_y = 1;
knockback_speed = 1;
kb_timer = 0;
// Hastighet när den går
walk_speed = 0.5;

// 0 = stilla, 1 = vänster, 2 = höger, 3 = upp, 4 = ner
state = 0;

// Tid tills nästa val
state_timer = irandom_range(60, 120); // 1-2 sek
