function scr_BisonChargeAttack() {
    with(obj_Bison) {
        // Trigger the "buildup" animation. When this ends the charge it triggered
        if (!charge_started) {
            sprite_index = Spr_Bison_SprintAttackBuildUp;
            image_index = 0;
            charge_started = true;
        } else {
            if (sprite_index == Spr_Bison_SprintAttackBuildUp) {
                if (floor(image_index) >= sprite_get_number(sprite_index) - 1) {
                    // Buildup animation complete, start the charge attack
                    /// @type {Id.Instance.obj_BisonSprintAttackHitbox}}
                    var attack_hitbox = instance_create_depth(x, y, depth, obj_BisonSprintAttackHitbox);
                    attack_hitbox.image_xscale = image_xscale;
                    attack_hitbox.damage = damage;
                    attack_hitbox.owner = id;

                    // Set the sprite and reset the cooldown
                    image_index = 0;
                    sprite_index = Spr_Bison_SprintAttack;
                    attack_cooldown_timer = attack_cooldown;
                    charge_complete = false;
                    //show_debug_message("Trigger Charge Attack");
                }
            } else {
                if (charge_complete) {
                    // Set the idle state sprite and move back to the starting position
                    //show_debug_message("Charge Attack Completed");
                    state = BisonState.RETURN;
                    sprint_index = Spr_Bison_Idle;
                    return_delay_timer = return_delay;
                    charge_complete = false;
                    charge_started = false;

                    instance_destroy(obj_BisonSprintAttackHitbox);
                } else {
                    // Move the bison forward in the direction it is facing
                    x += charge_move_speed * facing;
                    // Check if the attack animation has finished, if so return to the IDLE state
                    if (!charge_complete  && x >= starting_position[0] + charge_attack_distance) {
                        charge_complete = true;
                    }
                }
            }
        }

		//show_debug_message($"Image Index: {string(image_index)} | Sprite Number: {string(sprite_get_number(sprite_index))}");
	}
}