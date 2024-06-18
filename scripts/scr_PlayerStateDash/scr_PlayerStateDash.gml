// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_PlayerStateDash(){
	alarm[0] = alarm[0] - 1
	if (sprite_index = Xielianwalkdown){
		sprite_index = Spr_DashDown;
		y = y + 10
	}
	if (sprite_index = XieLianwalkright){
		sprite_index = Spr_DashRight;
	x = x + 10

	}
	if (sprite_index = XieLianwalkleft){
		sprite_index = Spr_DashLeft;
	x = x - 10
	}
	if (sprite_index = XieLianwalkup){
		sprite_index = Spr_DashUp;
		y = y - 10
	}
	if (image_index > 6){
		state = PLAYERSTATE.FREE
	}
}