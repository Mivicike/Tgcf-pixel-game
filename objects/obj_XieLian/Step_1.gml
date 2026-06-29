// Switch statement to handle player state
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
    case PLAYERSTATE.DEATH:
        // Once in the death state, we can stop all movement and play the death animation
        hspd = 0;
        vspeed = 0;
        sprite_index = spr_XieLian_Death;
        image_index = 0; // Start the death animation from the beginning
        if (scr_AnimationEnd()) {
            image_speed = 0; // Stop the animation at the last frame
        }
        exit;
}