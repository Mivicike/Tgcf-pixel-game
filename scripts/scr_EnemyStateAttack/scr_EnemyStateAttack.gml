function scr_EnemyStateAttack() {
    if (!instance_exists(obj_XieLian) || obj_XieLian.state == PLAYERSTATE.DEATH) {
        state = EnemyState.FREE;
        exit;
    }

	// Instantiate attack sprite
	var currentName = scr_ExtractName(id)

	var _inst = pointer_null;

	if (hp <= 0) {
		state = EnemyState.DEAD;
		return;
	}

	// Apply any knockback if the kb_timer is greater than 0
	if (kb_timer > 0) {
		x += kb_x * kb_strength;
	    kb_timer--;
	}

	if (sprite_index != Spr_GreenGhostShooting_Right && sprite_index != Spr_GreenGhostShooting_Left) {
		if (facing == 1) {
			sprite_index = Spr_GreenGhostShooting_Right;
	        _inst = instance_create_depth(x + 15, y, depth, asset_get_index(obj_GreenGhost_attack_right));
		} else {
			sprite_index = Spr_GreenGhostShooting_Left;
	        _inst = instance_create_depth(x - 15, y, depth, asset_get_index(obj_GreenGhost_attack_left));
		}

		image_index = 0;

		alarm[1] = game_get_speed(gamespeed_fps) * 2; // 2 second cooldown before next attack
	    _inst.damage = damage;
	    _inst.owner = id;
	}

	if (floor(image_index) >= sprite_get_number(sprite_index) - 1) {
		state = EnemyState.FREE;
	}

	if (_inst == pointer_null) {
		attack_spawned = false;
	}
}