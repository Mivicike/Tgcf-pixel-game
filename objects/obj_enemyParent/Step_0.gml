switch(state) {
	case EnemyState.FREE:
		scr_EnemyStateFree();
        break;
	case EnemyState.ATTACK:
		scr_EnemyStateAttack();
        break;
	case EnemyState.DEAD:
		break;
}

if (hp <= 0) {
	state = EnemyState.DEAD;
    // Destroy the instance after the alarm goes off
    instance_destroy();
}