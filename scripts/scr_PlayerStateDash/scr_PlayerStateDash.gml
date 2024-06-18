// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_PlayerStateDash(){

	if (sprite_index = Xielianwalkdown){
		sprite_index = Spr_DashDown;
	
	}
	if (sprite_index = XieLianwalkright){
		sprite_index = Spr_DashRight;
	

	}
	if (sprite_index = XieLianwalkleft){
		sprite_index = Spr_DashLeft;
	
	}
	if (sprite_index = XieLianwalkup){
		sprite_index = Spr_DashUp;
	
	}
	if (image_index >= image_number - image_speed){
		state = PLAYERSTATE.FREE
		sprite_index = save_sprite
	}
}