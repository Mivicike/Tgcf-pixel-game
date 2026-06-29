/// @description Handles the player's movement and state when in the free movement state (PLAYERSTATE.FREE).
function scr_PlayerStateFree() {
	/// @description Checks for collisions in both horizontal and vertical directions, allowing the player to slide along obstacles instead of stopping completely.
	function _collision_detection() {
		with(obj_XieLian) {
			// Check for movement independently in horizontal and vertical directions to allow sliding along obstacles
			// Check for horizontal movement
			if (!place_meeting(x + hsp, y, obj_obstacle)) {
				x += hsp;
			}

			// Check for vertical movement
			if (!place_meeting(x, y - vsp, obj_obstacle)) {
				y -= vsp; // Subtracting vsp to move up when pressing up
			}
		}
	}

	with(obj_XieLian) {
		if (kb_timer > 0) {
			kb_timer -= 1;

			hsp = kb_x * kb_strength;
			vsp = kb_y * kb_strength;
		} else {
			right = keyboard_check_direct(vk_right) or keyboard_check_direct(ord("D"));
			left = keyboard_check_direct(vk_left) or keyboard_check_direct(ord("A"));
			up = keyboard_check_direct(vk_up) or keyboard_check_direct(ord("W"));
			down = keyboard_check_direct(vk_down) or keyboard_check_direct(ord("S"));

			directx = right - left;
			directy = up - down;

			var movement_prevented = DIALOGUE_MANAGER.is_dialogue_active() || obj_CameraManager.fade_state != FADE_STATE.NONE || movement_locked;
			// Activating Attack
			if (keyboard_check_pressed(ord("X")) && !movement_prevented){
				save_sprite = sprite_index;
				state = PLAYERSTATE.ATTACK;
			}

			sprinting = keyboard_check(vk_shift) && !movement_locked;

			if (keyboard_check_pressed(ord("C")) && dash == false && dash_cooldown == 0 && !movement_prevented){
				dash = true;
				movement_locked = true;
				alarm_set(0, 16);
				save_sprite = sprite_index;
				state = PLAYERSTATE.DASH;
			}


			if(movement_locked) {
				exit; // Exit the function if movement is locked
			}

			// Normalize the direction vector for consistent speed in all directions
			if (!movement_prevented && (directx != 0 || directy != 0)) {
				var _length = sqrt(directx * directx + directy * directy);
				hsp = (directx / _length) * (sprinting ? sprint_speed : walk_speed);
				vsp = (directy / _length) * (sprinting ? sprint_speed : walk_speed);
			} else {
				hsp = 0;
				vsp = 0;
			}
		}

		_collision_detection();

		#region Sprite Selection
		if (x > xprevious) {
			sprite_index = spr_XieLian_WalkRight;
		}

		if(x < xprevious) {
			sprite_index = spr_XieLian_WalkLeft;
		}

		if (y > yprevious) {
			sprite_index = spr_XieLian_WalkDown;
		}

		if (y < yprevious) {
			sprite_index = spr_XieLian_WalkUp;
		}

		if (x == xprevious && y == yprevious) {
			image_index = 0;
		}

		image_speed = sprinting ? sprint_speed : walk_speed;
		#endregion
	}
}

