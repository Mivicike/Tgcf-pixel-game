// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_BisonStateAttack(){
	var _inst = undefined;
	if (hp <= 0) {
		state = EnemyState.DEAD;
		return;
	}

	if (alarm[1] <= 0) {
	    _inst = instance_create_depth(x, y, depth, obj_BisonAttackHitbox);
        _inst.image_xscale = image_xscale; 
	    _inst.damage = damage;
	    _inst.owner = id;
        
        image_index = 0;
        sprite_index = Spr_Bison_Attck;
	    alarm[1] = game_get_speed(gamespeed_fps) * 2; // 3 second cooldown
	}
    
    if (image_index >= sprite_get_number(sprite_index) - 1)
    {
        // Animation complete
        state = EnemyState.FREE;
    }
}