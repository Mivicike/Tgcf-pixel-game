event_inherited(); 
if (DIALOGUE_MANAGER.dialogue == global.dialogues.CartDriver1) {
    dialogue_was_active = true;
}
if (dialogue_was_active && !DIALOGUE_MANAGER.is_dialogue_active()) {
    dialogue_was_active = false;

    var _scene = instance_create_depth(0, 0, -20000, obj_CartScene);
    _scene.target_x = 307;
    _scene.target_y = 215;
}