scr_PlayerDeathCheck();
switch (state) {
	case PLAYERSTATE.FREE:
		scr_PlayerStateFree();
		break;
	case PLAYERSTATE.ATTACK:
		scr_PlayerState_Attack();
		break;
	case PLAYERSTATE.DASH:
		scr_PlayerStateDash();
		break;
	case PLAYERSTATE.HOLDING_HANDS:
		scr_PlayerStateHoldingHands();
		break;
	case PLAYERSTATE.DEATH:
		hspd = 0;
		vspeed = 0;
		sprite_index = spr_XieLian_Death;
		image_index = 0;
		if (scr_AnimationEnd()) {
			image_speed = 0;
		}
		exit;
}