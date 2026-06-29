enum EnemyState{
	FREE,
	ATTACK,
	DEAD
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
attack_spawned = false;

var save_data = scr_SaveData_GetEnemyState(id);
if (save_data == undefined) {
    scr_SaveData_SetEnemyState(id, {dead: false});
} else if (save_data.dead) {
    // If the enemy is marked as dead in the save data, destroy this instance to immediately beat the puzzle if it has been spawned by mistake
    instance_destroy();
}