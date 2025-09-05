function scr_PlayerState_Attack(){
	#region	//ATTACKING
	hspeed = 0;
	vspeed = 0;
	
	if (sprite_index = Xielianwalkdown){
		sprite_index = StrikeDown;
		image_index = 0;
		ds_list_clear(hit_by_attack)
	}
	if (sprite_index = XieLianwalkright){
		sprite_index = StrikeRight;
		image_index = 0;
		ds_list_clear(hit_by_attack)
	}
	if (sprite_index = XieLianwalkleft){
		sprite_index = StrikeLeft;
		image_index = 0;
		ds_list_clear(hit_by_attack)
	}
	if (sprite_index = XieLianwalkup){
		sprite_index = StrikeUp;
		image_index = 0;
		ds_list_clear(hit_by_attack)
	}
	if (image_index >= image_number - image_speed){
		state = PLAYERSTATE.FREE
		sprite_index = save_sprite
	}
	
	// Use attack hitbox and check for hits
	mask_index = 

}

	