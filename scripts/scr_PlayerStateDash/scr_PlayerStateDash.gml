// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_PlayerStateDash(){

	if (sprite_index == Xielianwalkdown and dash){
		dash_dir = 270;
		sprite_index = Spr_DashDown;
	
	}
	if (sprite_index == XieLianwalkright and dash){
		dash_dir = 0;
		sprite_index = Spr_DashRight;
	

	}
	if (sprite_index == XieLianwalkleft and dash){
		dash_dir = 180;
		sprite_index = Spr_DashLeft;
	
	}
	if (sprite_index == XieLianwalkup and dash){
		dash_dir = 90;
		sprite_index = Spr_DashUp;
	
	}
	
	if(dash) {
		// Apply dash speed to the player's velocity
		vspeed = lengthdir_y(dash_speed, dash_dir);
		hspeed = lengthdir_x(dash_speed, dash_dir);
		friction = 0.3;
		draw_yscale = .7;
		draw_xscale = 1.3;
		dash_cooldown= 1;

	}	
	
// DASH COLLISION TODO
    if place_meeting(x+lengthdir_x(dash_speed, dash_dir), y+lengthdir_y(dash_speed, dash_dir), obj_XieLian){
        dash = false; // disable dashing
        alarm[0] = -1; // disable the previously set alarm
        
        // make it pixel perfect
        repeat(ceil(abs(dash_speed)))
            {
            if !place_meeting(x+lengthdir_x(1, dash_dir), y+lengthdir_y(1, dash_dir), obj_XieLian)
                {
                vspeed += lengthdir_x(1, dash_dir);
                hspeed += lengthdir_y(1, dash_dir);
                }
            else break;
       }
	   
	    // Stop the player after collision
        vspeed = 0;
        hspeed = 0;
	}
}