function scr_PlayerState_Attack_Combo(){
	#region	//ATTACKING
	
	hspeed = 0;
	vspeed = 0;
	
	if (obj_XieLian.attack_started != true){
			// Randomly decides to use combo1 or combo2
			var combo_choice = irandom(1);
			if (combo_choice == 0){
				if (sprite_index = Xielianwalkdown){
					sprite_index = spr_XieLian_Combo1_Down;
					image_index = 0;
					ds_list_clear(hit_by_attack)
		
					// Use attack hitbox and check for hits
					mask_index = spr_XieLian_Combo1_DownHB;
					show_debug_message(mask_index)
				}
				if (sprite_index = XieLianwalkright){
					sprite_index = spr_XieLian_Combo1_Right;
					image_index = 0;
					ds_list_clear(hit_by_attack)
		
					// Use attack hitbox and check for hits
					mask_index = spr_XieLian_Combo1_RightHB;
				}
				if (sprite_index = XieLianwalkleft){
					sprite_index = spr_XieLian_Combo1_Left;
					image_index = 0;
					ds_list_clear(hit_by_attack)
		
					// Use attack hitbox and check for hits
					mask_index = spr_XieLian_Combo1_LeftHB;
				}
				if (sprite_index = XieLianwalkup){
					sprite_index = spr_XieLian_Combo1_Up;
					image_index = 0;
					ds_list_clear(hit_by_attack)
		
					// Use attack hitbox and check for hits
					mask_index = spr_XieLian_Combo1_UpHB;
				}
			}
			else {
				if (sprite_index = Xielianwalkdown){
					sprite_index = spr_XieLian_Combo2_Down;
					image_index = 0;
					ds_list_clear(hit_by_attack)
		
					// Use attack hitbox and check for hits
					mask_index = spr_XieLian_Combo2_DownHB;
					show_debug_message(mask_index)
				}
				if (sprite_index = XieLianwalkright){
					sprite_index = spr_XieLian_Combo2_Right;
					image_index = 0;
					ds_list_clear(hit_by_attack)
		
					// Use attack hitbox and check for hits
					mask_index = spr_XieLian_Combo2_RightHB;
				}
				if (sprite_index = XieLianwalkleft){
					sprite_index = spr_XieLian_Combo2_Left;
					image_index = 0;
					ds_list_clear(hit_by_attack)
		
					// Use attack hitbox and check for hits
					mask_index = spr_XieLian_Combo2_LeftHB;
				}
				if (sprite_index = XieLianwalkup){
					sprite_index = spr_XieLian_Combo2_Up;
					image_index = 0;
					ds_list_clear(hit_by_attack)
		
					// Use attack hitbox and check for hits
					mask_index = spr_XieLian_Combo2_UpHB;
				}				
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
					scr_Damage(id, 3, other);
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

	