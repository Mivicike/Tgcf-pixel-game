if (hp <= 0) {
	state = EnemyState.DEAD;
}

switch(state)
{
	case BisonState.IDLE:
		scr_BisonStateFree();
		break;
	case BisonState.ATTACK:
		scr_BisonStateAttack();
		break;
	case BisonState.CHARGE_ATTACK:
		scr_BisonChargeAttack();
		break;
	case BisonState.RETURN:
		scr_BisonStateReturn();
		break;
	case BisonState.DEAD:
		instance_destroy();
		break;
}