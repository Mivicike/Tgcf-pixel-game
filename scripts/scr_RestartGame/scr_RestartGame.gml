function scr_RestartGame() {
    var _path = game_save_id + "save_slot_" + string(global.current_save_slot) + ".json";
    if (file_exists(_path)) {
        file_delete(_path);
    }

    global.save_data = undefined;         
    global.yuan = global.starting_yuan;
    inventory_init();
    GAME_CAMERA.reset_all();
}