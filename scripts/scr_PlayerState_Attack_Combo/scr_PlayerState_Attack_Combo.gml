function scr_PlayerState_Attack_Combo(){
	#region	//ATTACKING
	
	if (sprite_index = Xielianwalkdown){
		sprite_index = spr_XieLian_Combo1_Down;	
	}
	if (sprite_index = XieLianwalkright){
		sprite_index = StrikeRight;
	}
	if (sprite_index = XieLianwalkleft){
		sprite_index = StrikeLeft;
	}
	if (sprite_index = XieLianwalkup){
		sprite_index = StrikeUp;
	}
	if (image_index >= image_number - image_speed){
		state = PLAYERSTATE.FREE
		sprite_index = save_sprite
	}

}

	