/// load_game(slot)
function scr_LoadGame(_slot) {
    var path = game_save_id + "save_slot_" + string(_slot) + ".json";
    if (!file_exists(path)) {
        show_debug_message($"Save slot {string(_slot)} does not exist. Cannot load game.");
        return false;
    }

    var file = file_text_open_read(path);
    var json  = "";
    while (!file_text_eof(file)) {
        json += file_text_read_string(file);
        file_text_readln(file);
    }
    file_text_close(file);
    global.save_data = json_parse(json);
    show_debug_message($"Successfully loaded save data from {string(path)}}");
    return true;
}