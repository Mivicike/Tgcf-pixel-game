/// @description This alarm is triggered when the puzzle is loaded but has already been completed in a previous game session

// Trigger the puzzle complete logic to ensure the game state is consistent with the save data
event_user(0);

// Set alarm 1 to ensure the camera is reset after 1 step (1/60th of a second)
alarm[2] = 1;