function scr_BisonStateAttack() {
	with(obj_Bison) {
		if (sprite_index != Spr_Bison_Attck) {
			/// @type {Id.Instance.obj_BisonAttackHitbox}}
			var attack_hitbox = instance_create_depth(x, y, depth, obj_BisonAttackHitbox);
			attack_hitbox.image_xscale = image_xscale;
			attack_hitbox.damage = damage;
			attack_hitbox.owner = id;

			// Set the sprite and reset the cooldown
			image_index = 0;
			sprite_index = Spr_Bison_Attck;
			attack_cooldown_timer = attack_cooldown;
		}

		// Check if the attack animation has finished, if so return to the IDLE state
		//show_debug_message($"Image Index: {string(image_index)} | Sprite Number: {string(sprite_get_number(sprite_index))}");
		if (floor(image_index) >= sprite_get_number(sprite_index) - 1) {
			// Animation complete
			state = BisonState.IDLE;
            instance_destroy(obj_BisonAttackHitbox);
		}
	}
}