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
    global.yuan = global.save_data.player.yuan;

    show_debug_message($"Loaded player data: HP = {string(player.hp)}, Max HP = {string(player.liv)}, Position = ({string(player.x)}, {string(player.y)}), yuan = {string(global.yuan)}");

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
// Make sure San Lang is in the right room
if (!instance_exists(obj_SanLang) && scr_SaveData_GetFlag("puqi_arrived", false) && !scr_SaveData_GetFlag("sanlang_gone", false)) {
	instance_create_depth(0, 0, 0, obj_SanLang);
}
if (!instance_exists(obj_HuaCheng) && scr_SaveData_GetFlag("hualian_bed_scene_done", false)) {
	scr_SpawnPersistentCharacter(obj_HuaCheng, QirongCave, 2990, 1110);
}
if (!instance_exists(obj_NanFeng) && scr_SaveData_GetFlag("hualian_bed_scene_done", false)) {
	scr_SpawnPersistentCharacter(obj_NanFeng, puqi_village, 980, 250);
}
if (!instance_exists(obj_FuYao) && scr_SaveData_GetFlag("hualian_bed_scene_done", false)) {
	scr_SpawnPersistentCharacter(obj_FuYao, puqi_village, 1010, 250);
}
if (room == puqi_village && !instance_exists(Obj_LanternSeller) && scr_SaveData_GetFlag("nanfeng_ghost_report_given", false)) {
	instance_create_depth(397, 727, 0, Obj_LanternSeller);
}
// Set the camera target to the player
GAME_CAMERA.set_target(obj_XieLian);

// Destroy the spawn marker after spawning the player to prevent multiple instances from being created
instance_destroy(obj_XieLianSpawnMarker);