if (instance_exists(obj_XieLian)) {
    // Player has already been created inside another room so we can just delete this
    instance_destroy();
    exit;
}

if (global.save_data != undefined) {
    show_debug_message("Save data found. Loading player data from save.");
    // Spawn player
    /// @type {Id.Instance.obj_XieLian}
    var player = instance_create_layer(0, 0, layer, obj_XieLian);

    player.hp = global.save_data.player.hp;
    player.liv = global.save_data.player.max_hp;
    player.x = global.save_data.player.x;
    player.y = global.save_data.player.y;
    global.kronor = global.save_data.player.kronor;

    show_debug_message($"Loaded player data: HP = {string(player.hp)}, Max HP = {string(player.liv)}, Position = ({string(player.x)}, {string(player.y)}), Kronor = {string(global.kronor)}");

    // Set the inventory
    global.inventory = variable_clone(global.save_data.player.items);
} else {
    show_debug_message("No save data found. Spawning player as new game.");
    // Spawn player
    /// @type {Id.Instance.obj_XieLian}
    instance_create_layer(x, y, layer, obj_XieLian);
    inventory_init();

    // Create a new save data struct and save the game
    global.save_data = new SaveData();
    scr_SaveData_SavePlayerAndInventory();
}

// Set the camera target to the player
GAME_CAMERA.set_target(obj_XieLian);

// Destroy the spawn marker after spawning the player to prevent multiple instances from being created
instance_destroy(obj_XieLianSpawnMarker);