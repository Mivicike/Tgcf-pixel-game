/// @description Check if the save data exists and is valid
function scr_SaveData_CheckSaveDataExists() {
    if (variable_global_exists("save_data") && global.save_data == undefined) {
        show_debug_message("Error: Save data is undefined. Cannot set player data.");
        return false;
    }

    return true;
}

/// @description Register the state of an object in the save data.
/// @param {Id.Instance} _object_id The ID of the object to register
/// @param {Struct} _data The state data to register for the object
function scr_SaveData_SetObjectState(_object_id, _data) {
    if (!scr_SaveData_CheckSaveDataExists())
        return;

    // Register the object state in the save data
    global.save_data.world.objects[$ _object_id] = _data;
    if (variable_global_exists("auto_save") && global.auto_save) {
        scr_SaveGame(global.current_save_slot);
    }
}

/// @description Get the state of an object from the save data.
/// @param {Id.Instance} _object_id The ID of the object to retrieve state for
function scr_SaveData_GetObjectState(_object_id) {
    if (!scr_SaveData_CheckSaveDataExists())
        return undefined;

    // Retrieve the object state from the save data
    return global.save_data.world.objects[$ _object_id];
}

/// @description Mark the specified enemy as killed in the save data.
/// @param {String} _enemy_id The ID of the enemy to mark as killed
/// @param {Struct} _data The state data to register for the enemy (optional)
function scr_SaveData_SetEnemyState(_enemy_id, _data) {
    if (!scr_SaveData_CheckSaveDataExists())
        return;

    global.save_data.world.dead_enemies[$ _enemy_id] = _data;
    if (variable_global_exists("auto_save") && global.auto_save) {
        scr_SaveGame(global.current_save_slot);
    }
}

/// @description Get the state of an enemy from the save data.
/// @param {String} _enemy_id The ID of the enemy to retrieve state for
function scr_SaveData_GetEnemyState(_enemy_id) {
    if (!scr_SaveData_CheckSaveDataExists())
        return undefined;

    // Retrieve the enemy state from the save data
    return global.save_data.world.dead_enemies[$ _enemy_id];
}

/// @description Mark the specified puzzle as completed in the save data.
/// @param {String} _puzzle_id The ID of the puzzle to mark as completed
/// @param {Struct} _data The state data to register for the puzzle (optional)
function scr_SaveData_SetPuzzleState(_puzzle_id, _data) {
    if (!scr_SaveData_CheckSaveDataExists())
        return;
    global.save_data.world.puzzles[$ _puzzle_id] = _data;
    if (variable_global_exists("auto_save") && global.auto_save) {
        scr_SaveGame(global.current_save_slot);
    }
}

/// @description Get the state of a puzzle from the save data.
/// @param {String} _puzzle_id The ID of the puzzle to retrieve state for
function scr_SaveData_GetPuzzleState(_puzzle_id) {
    if (!scr_SaveData_CheckSaveDataExists())
        return undefined;

    // Retrieve the puzzle state from the save data
    return global.save_data.world.puzzles[$ _puzzle_id];
}

/// @description Set the player data in the save data struct
/// @param {Id.Instance.obj_XieLian} _player The player object to extract data from
function scr_SaveData_SetPlayerData(_player) {
    if (!scr_SaveData_CheckSaveDataExists())
        return;

    var player = global.save_data.player;
    player.hp = _player.hp;
    player.max_hp = _player.liv;
    player.room = room;
    player.x = floor(_player.x);
    player.y = floor(_player.y);
    player.kronor = global.kronor;
}

/// @description Set the inventory data in the save data struct
/// @param {Array<Struct.InventorySlot>} _inventory The inventory struct to extract data from
function scr_SaveData_SetInventoryData(_inventory) {
    if (!scr_SaveData_CheckSaveDataExists())
        return;

    var player = global.save_data.player;
    player.items = variable_clone(_inventory);
}

/// @description Automatically save the game if save data exists
function scr_SaveData_SavePlayerAndInventory() {
    if (!scr_SaveData_CheckSaveDataExists())
        return;

    // Update the timestamp and play time
    scr_SaveData_SetPlayerData(obj_XieLian);
    scr_SaveData_SetInventoryData(global.inventory);

    // Save the game
    scr_SaveGame(global.current_save_slot);
}