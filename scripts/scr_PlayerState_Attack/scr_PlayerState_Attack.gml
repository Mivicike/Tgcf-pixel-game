function scr_PlayerState_Attack(){
	#region	//ATTACKING
	hspeed = 0;
	vspeed = 0;
	
	if (obj_XieLian.attack_started != true){
		
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
			
			obj_XieLian.attack_started = true
	}
		
	var hitByAttackNow = ds_list_create();
	var hits = instance_place_list(x,y,obj_enemyParent, hitByAttackNow, false)
	
	
	if (hits > 0){
		for (var i = 0; i < hits; i++){
			// If this instance has not yet been hit by this attack
			var hitID = hitByAttackNow[| i];
			if (ds_list_find_index(hit_by_attack, hitID) == -1){ 
				ds_list_add(hit_by_attack, hitID);  
				with (hitID){
					scr_Damage(id, 1, other);
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