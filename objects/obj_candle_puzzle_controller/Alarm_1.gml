/// @description This alarm is triggered when the boss is defeated. It handles the post-battle logic, such as opening the door and resetting the camera.
layer_set_visible(door_layer, false);
if (door_warp_object != undefined) {
    instance_activate_object(door_warp_object);
}

// Remove the door lock now that the boss is dead
instance_deactivate_object(arena_lock);

// Renable any camera triggers now that the battle is complete
for(var index = 0; index < array_length(camera_triggers); index++)
{
    instance_activate_object(camera_triggers[index]);
}

// Set an alarm to reset the camera after 1 second (60 steps)
alarm[2] = 60;