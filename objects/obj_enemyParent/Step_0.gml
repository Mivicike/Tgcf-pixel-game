switch(state) {
	case EnemyState.FREE:
		scr_EnemyStateFree();
	case EnemyState.ATTACK:
		scr_EnemyStateAttack();
}
	
if (alarm[2] == 0) {
    // Destroy the instance after the alarm goes off
    instance_destroy();
}
