depth = -bbox_bottom;
if (!instance_exists(obj_XieLian)) exit;

var _player_busy = obj_XieLian.movement_locked || DIALOGUE_MANAGER.is_dialogue_active();
var _dist = point_distance(x, y, obj_XieLian.x, obj_XieLian.y);
show_prompt = (_dist < 40 && !_player_busy);

if (show_prompt && keyboard_check_pressed(ord("Z"))) {
    obj_XieLian.movement_locked = true; 
    
    // Create the confirmation popup
    instance_create_depth(0, 0, -10000, obj_WishConfirmPopup);
}