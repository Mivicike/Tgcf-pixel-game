/// Assuming obj_character is the character object
var character_depth = layer_get_depth(obj_XieLian.layer);
show_debug_message(character_depth)
show_debug_message(depth)

if (y < obj_XieLian.y) {
    // Character is in front of gate
    depth = character_depth - 200;
} else {
    // Character is behind gate
    depth = character_depth  + 200;
}