function scr_PlayerState_Attack() {
	#region	//ATTACKING
	hspeed = 0;
	vspeed = 0;

	if (obj_XieLian.attack_started != true){
		switch(sprite_index) {
			case Xielianwalkdown: {
				select_attack_sprite(attack_direction.DOWN);
				break;
			}
			case XieLianwalkright: {
				select_attack_sprite(attack_direction.RIGHT);
				break;
			}
			case XieLianwalkleft: {
				select_attack_sprite(attack_direction.LEFT);
				break;
			}
			case XieLianwalkup: {
				select_attack_sprite(attack_direction.UP);
				break;
			}
			default: break;
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

function select_attack_sprite(attack_direction) {
	image_index = 0;

	// get the correct attack sprite based on the current number of hits
	var possible_attack_sprites = array_length(ATTACK_SPRITE_MATRIX[attack_direction]); // in case there is a different number of animations for a direction we get the number of sprites for the current direction --- can be replaced by a constant
	var attack_sprite_counter = select_attack_sprite_counter(possible_attack_sprites); // get the attack animation number based on the number of times the attack button was pressed
	var attac_sprite_pair = ATTACK_SPRITE_MATRIX[attack_direction, attack_sprite_counter]; // get the actual attack animation from the predefined macro

	// set the sprites for animation
	sprite_index = attac_sprite_pair.base;
	ds_list_clear(hit_by_attack);

	// Use attack hitbox and check for hits
	mask_index = attac_sprite_pair.hurt_box;
}

function select_attack_sprite_counter(sprite_counter) {
	var now = current_time;
	var current_attack_sprite = 0;

	if (variable_global_exists("last_attack_time")) {
		// if less than 1s has passed since last attack, then move to the next attack sprite
		if (global.last_attack_time - now < 1000) {
			current_attack_sprite = (global.last_attack_sprite + 1) % sprite_counter;
		} 
	}

	global.last_attack_time = now;
	global.last_attack_sprite = current_attack_sprite;
	return current_attack_sprite;
}
