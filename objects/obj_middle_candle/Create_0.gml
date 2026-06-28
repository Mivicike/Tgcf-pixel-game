event_inherited();

required_item = global.items.ghost_fire_red;
missing_item_message = "I have no way to light this.";
has_item_message = "Light candle!";

is_lit = false;
message_offset_y = -32;

// Register with the save system setting the default state to unlit
var saved_state = scr_SaveData_GetObjectState(id);
if (saved_state == undefined) {
    scr_SaveData_SetObjectState(id, { is_lit: false });
} else {
    // Load the saved state
    show_debug_message($"Loading saved state for candle {string(id)}. State: {string(saved_state.is_lit)}");
    is_lit = saved_state.is_lit;
}