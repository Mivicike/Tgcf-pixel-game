switch(state) {
	case EnemyState.FREE:
		scr_EnemyStateFree();
	case EnemyState.ATTACK:
		scr_EnemyStateAttack();
	case EnemyState.DEAD:
		break;
}

if (hp <= 0) {
	state = EnemyState.DEAD;
}
	
if (alarm[2] == 0) {
    // Destroy the instance after the alarm goes off
    instance_destroy();
}
