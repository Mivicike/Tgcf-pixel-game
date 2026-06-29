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
        scr_SaveData_SavePlayerAndInventory();
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
        scr_SaveData_SavePlayerAndInventory();
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
        scr_SaveData_SavePlayerAndInventory();
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

/// @description Automatically save the game if save data exists
function scr_SaveData_SavePlayerAndInventory() {
    if (!scr_SaveData_CheckSaveDataExists())
        return;

    if (obj_XieLian == undefined) {
        show_debug_message("Error: Player object (obj_XieLian) is undefined. Cannot save player data.");
        return;
    }

    var player = global.save_data.player;
    if (instance_exists(obj_XieLian)) {
        player.hp = obj_XieLian.hp;
        player.max_hp = obj_XieLian.liv;
        player.room = room;
        player.x = floor(obj_XieLian.x);
        player.y = floor(obj_XieLian.y);
        player.kronor = global.kronor;
    }

    player.items = variable_clone(global.inventory);

    // Save the game
    scr_SaveGame(global.current_save_slot);
}