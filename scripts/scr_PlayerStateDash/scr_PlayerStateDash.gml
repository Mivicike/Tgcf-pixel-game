// Raycast function to check for collisions along the dash path
function raycast_check(_x_start, _y_start, _x_end, _y_end) {
    var _steps = ceil(point_distance(_x_start, _y_start, _x_end, _y_end));
    for (var _i = 0; _i <= _steps; _i++) {
        var _check_x = _x_start + (_x_end - _x_start) * (_i / _steps);
        var _check_y = _y_start + (_y_end - _y_start) * (_i / _steps);
        if (place_meeting(_check_x, _check_y, obj_obstacle)) {
            return true; // Collision detected
        }
    }
    return false; // No collision
}

function scr_PlayerStateDash() {
    if (dash) {
        // Set dash direction and sprite
        if (sprite_index == spr_XieLian_WalkDown) {
            dash_dir = 270;
            sprite_index = Spr_DashDown;
        }
		
		if (sprite_index == spr_XieLian_WalkRight) {
            dash_dir = 0;
            sprite_index = Spr_DashRight;
        } 
		
		if (sprite_index == spr_XieLian_WalkLeft) {
            dash_dir = 180;
            sprite_index = Spr_DashLeft;
        }
		
		if (sprite_index == spr_XieLian_WalkUp) {
            dash_dir = 90;
            sprite_index = Spr_DashUp;
        }

        // Calculate future position
        var _future_x = x + lengthdir_x(dash_speed, dash_dir);
        var _future_y = y + lengthdir_y(dash_speed, dash_dir);
		
		// Checks if dash is stopped at the start of the movement
	    if (place_meeting(x, y, obj_obstacle)) {
	        // Dash is blocked immediately
	        audio_stop_sound(Snd_Dash);
	        alarm_set(0, -1);
	        vspeed = 0;
	        hspeed = 0;
	        sprite_index = save_sprite;
	        state = PLAYERSTATE.FREE;
	        dash = false;
	        movement_locked = false;
	        alarm_set(1, 180);
	        return;
	    }

        // Perform raycast collision detection
        var _collision_detected = raycast_check(x, y, _future_x, _future_y);

        // Handle collision
        if (_collision_detected) {
            alarm_set(0,-1); // Disable the previously set alarm

            // Stop the player after collision
            if (state == PLAYERSTATE.DASH) {
			    vspeed = 0;
			    hspeed = 0;
			    sprite_index = save_sprite;
			    state = PLAYERSTATE.FREE;
			    dash = false;
				movement_locked = false;
				alarm_set(1,180)
			}

        } else {
            // Move the player if no collision
            x = _future_x;
            y = _future_y;
			friction = 0.3;
			draw_yscale = .7;
			draw_xscale = 1.3;
			obj_XieLian.dash_cooldown = 1;
			if (!audio_is_playing(Snd_Dash)) {
				audio_play_sound(Snd_Dash, 1, false);
			}
        }
    }
}

