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
    scr_SaveData_SetObjectState(id, { completed : false });
} else {
    // Event was completed in a previous game session so auto complete
    event_completed = true;
    alarm[1] = 1;
}
