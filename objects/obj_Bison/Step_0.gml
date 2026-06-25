switch(state) {
	case EnemyState.FREE:
		scr_BisonStateFree();
        break;
	case EnemyState.ATTACK:
		scr_BisonStateAttack();
        break;
	case EnemyState.DEAD:
		break;
}

if (hp <= 0) {
	state = EnemyState.DEAD;
    instance_destroy();
}