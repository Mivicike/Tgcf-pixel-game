/// @description This alarm is triggered when the boss is defeated. It handles the post-battle logic, such as opening the door and resetting the camera.

// Complete the puzzle in the save data to ensure it remains completed in future game sessions
event_user(0);

// Set an alarm to reset the camera after 1 second (60 steps)
alarm[2] = 60;