function scr_PlayerStateFree(){
#region	//key setting

	right = keyboard_check_direct(vk_right) or keyboard_check_direct(ord("D"));
	left = keyboard_check_direct(vk_left) or keyboard_check_direct(ord("A"));
	up = keyboard_check_direct(vk_up) or keyboard_check_direct(ord("W"));
	down = keyboard_check_direct(vk_down) or keyboard_check_direct(ord("S"));
	
	attack =  keyboard_check_pressed(ord("X"));

	directx = right - left; 
	directy = up - down;

#endregion	
#region	//WALKING//

	if(right) x += hsp;

	if(left) x -= hsp;

	if(down) y += vsp;

	if(up) y -= vsp;
#endregion	
#region	//the direction of the sprite after walking
if (attack_state = false){
if (x>xprevious){
	sprite_index = XieLianwalkright;
	image_speed = 1;
	}	
if (x<xprevious){
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
}
if (x = xprevious and y = yprevious and attack_state = false){
	image_speed = 1; image_index = 0;
	}
#endregion	
#region	//ATTACKING
if (attack){
	attack_state = true;
}
if (attack_state = true){
	if (sprite_index = Xielianwalkdown or sprite_index = StrikeDown){
		sprite_index = StrikeDown;
		if (image_index > 4){
		attack_state = false;
		}
	}
	if (sprite_index = XieLianwalkright or sprite_index = StrikeRight){
		sprite_index = StrikeRight;
		if (image_index > 4){
		attack_state = false;
		}

	}
	if (sprite_index = XieLianwalkleft or sprite_index = StrikeLeft){
		sprite_index = StrikeLeft;
		if (image_index > 4){
		attack_state = false;
		}
	}
	if (sprite_index = XieLianwalkup or sprite_index = StrikeUp){
		sprite_index = StrikeUp;
		if (image_index > 4){
		attack_state = false;
		}
	}
}
	

#endregion	

}