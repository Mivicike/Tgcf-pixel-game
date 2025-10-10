function scr_PlayerState_Attack(){
	#region	//ATTACKING
	hspeed = 0;
	vspeed = 0;
	
	if (sprite_index = Xielianwalkdown){
		sprite_index = StrikeDown;
		image_index = 0;
		ds_list_clear(hit_by_attack)
		
		// Use attack hitbox and check for hits
		mask_index = StrikeDownHB;
	}
	if (sprite_index = XieLianwalkright){
		sprite_index = StrikeRight;
		image_index = 0;
		ds_list_clear(hit_by_attack)
		
		// Use attack hitbox and check for hits
		 mask_index = StrikeRightHB;
	}
	if (sprite_index = XieLianwalkleft){
		sprite_index = StrikeLeft;
		image_index = 0;
		ds_list_clear(hit_by_attack)
		
		// Use attack hitbox and check for hits
		mask_index = StrikeLeftHB;
	}
	if (sprite_index = XieLianwalkup){
		sprite_index = StrikeUp;
		image_index = 0;
		ds_list_clear(hit_by_attack)
		
		// Use attack hitbox and check for hits
		mask_index = StrikeUpHB;
	}
	
	var hitByAttackNow = ds_list_create();
	var hits = instance_place_list(x,y,obj_GreenGhost, hitByAttackNow, false)
	
	if (hits > 0){
		for (var i = 0; i < hits; i++){
			// If this instance has not yet been hit by this attack
			var hitID = hitByAttackNow[| i];
			if (ds_list_find_index(hitByAttackNow, hitID) == -1){
				ds_list_add(hitByAttackNow, hitID);
				with (hitID){
					show_debug_message("hi")
				}
			}
		}
	}
	
	mask_index = Xielianidledown
	ds_list_destroy(hitByAttackNow);
	
	
	if (scr_AnimationEnd()){
		state = PLAYERSTATE.FREE
		sprite_index = save_sprite
	}
}

	