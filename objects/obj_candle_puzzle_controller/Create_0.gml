event_triggered = false;
event_completed = false;

bison = undefined;
door_layer = "Ass_Opening";
/// @type {Id.Instance.Obj_Warp}
door_warp_object = undefined;
arena_lock = undefined;
camera_triggers = [];

left_candle = undefined;
middle_candle = undefined;
right_candle = undefined;

battle_camera_location = undefined;
battle_started = false;

var save_data = scr_SaveData_GetPuzzleState(id)
if (save_data == undefined) {
    scr_SaveData_SetPuzzleState(id, { completed : false });
} else if (save_data.completed) {
    // Make sure all flags are set to the "puzzle completed" state
    event_completed = true;
    event_triggered = true;
    battle_started = true;

    // Trigger the puzzle complete logic after 1 frame to allow other objects to be loaded in
    alarm[3] = 1
}
