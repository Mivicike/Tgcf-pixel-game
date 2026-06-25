if (event_completed)
    return; // Puzzle already completed, no need to check further

if (left_candle.is_lit && middle_candle.is_lit && right_candle.is_lit && !event_triggered) {
    // All candles are lit, trigger the puzzle completion event
    event_triggered = true;
    alarm[0] = 60; // Set an alarm to spawn the enemy after 1 second (60 steps)


    GAME_CAMERA.set_target(battle_camera_location);
    GAME_CAMERA.zoom_to(2.0, 0.5); // Zoom in to the battle area over 0.5 seconds
}
else if (!battle_started)
{
    // Make sure the arena lock is deactivated if the puzzle hasn't been triggered yet
    instance_deactivate_object(arena_lock);

    // Make sure the warp door is deactivated if the puzzle hasn't been triggered yet
    instance_deactivate_object(door_warp_object);
}

if (event_triggered && !event_completed && !instance_exists(bison) && battle_started) {
    // The enemy has been defeated, mark the event as completed
    event_completed = true;

    // Trigger the puzzle completion event (e.g., open a door, give a reward, etc.)
    show_debug_message("Puzzle completed! The bison has been defeated.");
    alarm[1]= 60; // Set an alarm to reset the camera after 1 second (60 steps)
}