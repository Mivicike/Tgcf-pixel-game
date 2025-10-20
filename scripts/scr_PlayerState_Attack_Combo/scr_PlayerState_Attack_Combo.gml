function scr_PlayerState_Attack_Combo(){
	#region	//ATTACKING
	
	if (sprite_index = Xielianwalkdown){
		sprite_index = spr_XieLian_Combo2_Down;	
		image_index = 0;
	}
	if (sprite_index = XieLianwalkright){
		sprite_index = spr_XieLian_Combo2_Right;
		image_index = 0;
	}
	if (sprite_index = XieLianwalkleft){
		sprite_index = spr_XieLian_Combo2_Left;
		image_index = 0;
	}
	if (sprite_index = XieLianwalkup){
		sprite_index = spr_XieLian_Combo2_Up;
		image_index = 0;
	}
	if (image_index >= image_number - image_speed){
		state = PLAYERSTATE.FREE
		sprite_index = save_sprite
	}

}

	