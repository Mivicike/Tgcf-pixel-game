function scr_PlayerStateFree(){
#region	//key setting
	right = keyboard_check_direct(vk_right) or keyboard_check_direct(ord("D"));
	left = keyboard_check_direct(vk_left) or keyboard_check_direct(ord("A"));
	up = keyboard_check_direct(vk_up) or keyboard_check_direct(ord("W"));
	down = keyboard_check_direct(vk_down) or keyboard_check_direct(ord("S"));
	
	directx = right - left; 
	directy = up - down;
	
#endregion	

#region //Switching betweeen states


// Activating Attack 
if (keyboard_check_pressed(ord("X"))){
	save_sprite = sprite_index;
	state = PLAYERSTATE.ATTACK;
}

if (keyboard_check_pressed(ord("C")) and dash == false and dash_cooldown == 0){
	dash = true;
	movement_locked = true;
	alarm_set(0, 16);
	save_sprite = sprite_index;
	state = PLAYERSTATE.DASH;
}

#endregion

#region //collision check function

	function collision_detection() {

    // Walk down
    if (down) {
        collision_enemy = collision_line(x, y, x, y + 50, obj_obstacle, false, true);
        my_direction = 180;
    }
    // Walk Left
    if (left) {
        collision_enemy = collision_line(x, y, x - 50, y, obj_obstacle, false, true);
        my_direction = 270;
    }
    // Walk up
    if (up) {
        collision_enemy = collision_line(x, y, x, y - 50, obj_obstacle, false, true);
        my_direction = 0;
    }
    // Walk Right
    if (right) { // Corrected to "right" here
        collision_enemy = collision_line(x, y, x + 50, y, obj_obstacle, false, true);
        my_direction = 90;
    }
}

#endregion	

#region	//WALKING//
	
	//diagonal moving
	if(!movement_locked){
		if( directy !=0 && directx !=0 ) {  
			spd = 0.6; 
			}
		else {
			spd = 1;}
		
		//strait moving
		hsp = directx * spd;
		vsp = directy * spd;
		x += hsp;
		y -= vsp;
	}

#endregion	

#region	//the direction of the sprite after walking
if(!movement_locked){
	if (x>xprevious){
		sprite_index = XieLianwalkright;
		image_speed = 1;
		}	
	if(x<xprevious){
		sprite_index = XieLianwalkleft; 
		image_speed = 1;
		}	
	if (y>yprevious){
		sprite_index = Xielianwalkdown;
		image_speed = 1;
		}	
	if (y<yprevious){
		sprite_index = XieLianwalkup;
		image_speed = 1;
		}
	if (x = xprevious and y = yprevious){
		image_speed = 1; image_index = 0;
		}
}
	
#endregion		

}