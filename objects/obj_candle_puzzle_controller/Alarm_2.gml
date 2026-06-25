/// @description This alarm is triggered when the boss is defeated. It handles the post-battle logic, such as opening the door and resetting the camera.
GAME_CAMERA.set_target(obj_XieLian);
GAME_CAMERA.zoom_to(1.0, 0.5); // Zoom in to the battle area over 0.5 seconds