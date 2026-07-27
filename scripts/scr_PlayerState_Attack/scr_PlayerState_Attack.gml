function scr_PlayerState_Attack() {
    with(obj_XieLian) {
        #region  //ATTACKING
        hspeed = 0;
        vspeed = 0;

        // Default damage is 1, but we check for combo attacks and set damage to 3 if necessary
        damage = 1;
        attack_sprite = pointer_null;

        if (attack_started != true) {
            switch (sprite_index) {
                case spr_XieLian_WalkDown:
                    attack_sprite = select_attack_sprite(attack_direction.DOWN);
                    break;
                case spr_XieLian_WalkRight:
                    attack_sprite = select_attack_sprite(attack_direction.RIGHT);
                    break;
                case spr_XieLian_WalkLeft:
                    attack_sprite = select_attack_sprite(attack_direction.LEFT);
                    break;
                case spr_XieLian_WalkUp:
                    attack_sprite = select_attack_sprite(attack_direction.UP);
                    break;
            }

            attack_started = true;
			var randSound = choose(Snd_Attack1, Snd_Attack2, Snd_Attack3);
			audio_play_sound(randSound, 1, false);
        }

        if (attack_sprite) {
            // Check if sprite_index contains the word "combo"
            if (string_pos("Combo", string(sprite_index)) > 0) {
                damage = 3;
            }
            else{
                damage = 1;
            }
        }

        var hitByAttackNow = ds_list_create();
        var hits = instance_place_list(x, y, obj_enemyParent, hitByAttackNow, false);
        if (hits > 0) {
            for (var i = 0; i < hits; i++) {
                // If this instance has not yet been hit by this attack
                var hitID = hitByAttackNow[| i];
                if (ds_list_find_index(hit_by_attack, hitID) == -1) {
                    ds_list_add(hit_by_attack, hitID);
                    scr_Damage(hitID.id, damage, self); // Damage depends on combo or not
                }
            }
        }

        mask_index = spr_XieLian_IdleDown;
        ds_list_destroy(hitByAttackNow);

        if (scr_AnimationEnd()) {
            state = PLAYERSTATE.FREE;
            sprite_index = save_sprite;
        }
    }
}

/// @description Calculates the current attack sprite to use based on the current attack sequence count and the facing direction of the player
/// @param {Enum.attack_direction} attack_direction The direction the player is facing
function select_attack_sprite(attack_direction) {

    /// @description Calculates the attack sprite index based on the time since the last attack and the number of available attack sprites for the current direction
    /// @param {Real} sprite_counter - The number of attack sprites available for the current direction
    function _get_sequence_sprite(sprite_counter) {
        with(obj_XieLian) {
            // If the time since the last attack is less than the reset time, increment the attack counter
            if (current_time - last_attack_time < attack_reset_time * 1000) {
                attack_counter = (attack_counter + 1) % sprite_counter;
            } else {
                // Reset the counter if the time since the last attack exceeds the reset time
                attack_counter = 0;
            }

            last_attack_time = current_time;
            return attack_counter;
        }
    }

    with(obj_XieLian) {
        image_index = 0;
        // get the correct attack sprite based on the current number of hits
        var possible_attack_sprites = array_length(ATTACK_SPRITE_MATRIX[attack_direction]); // in case there is a different number of animations for a direction we get the number of sprites for the current direction --- can be replaced by a constant
        var attack_sprite_counter = _get_sequence_sprite(possible_attack_sprites); // get the attack animation number based on the number of times the attack button was pressed

        /// @type {Struct.SpritePair}
        var attack_sprite_pair = ATTACK_SPRITE_MATRIX[attack_direction, attack_sprite_counter]; // get the actual attack animation from the predefined macro

        // set the sprites for animation
        sprite_index = attack_sprite_pair.base;
        ds_list_clear(hit_by_attack);

        // Use attack hitbox and check for hits
        mask_index = attack_sprite_pair.hurt_box;
        return sprite_index;
    }
}
