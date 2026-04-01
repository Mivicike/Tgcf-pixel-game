var hitByAttackNow = ds_list_create();
var hits = instance_place_list(x, y, obj_XieLian, hitByAttackNow, false);
	
if (hits > 0) {
	for (var i = 0; i < hits; i++) {
		// If this instance has not yet been hit by this attack
		var hitID = hitByAttackNow[| i];
		if (ds_list_find_index(hit_by_attack, hitID) == -1) { 
			ds_list_add(hit_by_attack, hitID);  
			with (hitID) {
			    // Apply the damage to the xie lian
			    scr_Damage(id, damage, other);
			}
		}
	}
}
