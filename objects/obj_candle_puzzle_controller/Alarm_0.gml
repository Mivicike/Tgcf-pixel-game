/// @description This alarm is triggered when the player has lit all the candles and is ready to fight the boss. It handles the battle initiation logic, such as spawning the enemy and locking the arena.

// Spawn the enemy for the player to fight
battle_started = true;
bison = instance_create_layer(x, y, "Ins_Puzzle", obj_Bison);

// Disable the camera triggers to prevent the player from activating them while the battle is occuring
for(var index = 0; index < array_length(camera_triggers); index++)
{
    instance_deactivate_object(camera_triggers[index]);
}

// Set the arena lock so the player cannot leave the battle once triggered
instance_activate_object(arena_lock);