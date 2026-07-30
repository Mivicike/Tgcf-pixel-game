if (!instance_exists(obj_XieLian)) exit;

var _player_busy = obj_XieLian.movement_locked || DIALOGUE_MANAGER.is_dialogue_active() || instance_exists(obj_KitchenUI);
var _dist = point_distance(x, y, obj_XieLian.x, obj_XieLian.y);
show_prompt = (_dist <= prompt_distance) && !_player_busy;

if (show_prompt && keyboard_check_pressed(ord("Z")) && !global.z_interaction_used) {
	global.z_interaction_used = true;
	instance_create_depth(0, 0, -9000, obj_KitchenUI);
	obj_XieLian.movement_locked = true;
}