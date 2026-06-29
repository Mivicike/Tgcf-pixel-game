/// @description This alarm is triggered when the boss is defeated. It handles the post-battle logic, such as opening the door and resetting the camera.

// Trigger a camera fade to hide
var me = self.id;
var data = {
    context : me
};

obj_CameraManager.fade_out(.5, function(_d) {
    // Set the layers, objects and camera triggers to their completed state
    with(_d.context) {
        show_debug_message("Puzzle completed. Setting layers, objects and camera triggers to completed state.");

        // Complete the puzzle in the save data to ensure it remains completed in future game sessions
        event_user(0);
    }

    with(obj_CameraManager) {
        fade_in(default_fade_time, .5);
    }

    // Set an alarm to reset the camera after 1 second (60 steps)
    obj_candle_puzzle_controller.alarm[2] = 60;
}, data, .5);