// save_game(slot)
function scr_SaveGame(_slot) {
    var path = game_save_id + "save_slot_" + string(_slot) + ".json";
    var tmp  = game_save_id + "save_slot_" + string(_slot) + ".tmp";

    // Write to tmp first, then rename (crash safety)
    var file = file_text_open_write(tmp);
    file_text_write_string(file, json_stringify(global.save_data, true));
    file_text_close(file);

    if (file_exists(path))
        file_delete(path);

    file_rename(tmp, path);
    show_debug_message($"Saving to: {path}");
    show_debug_message($"File written successfully: {string(file_exists(path) ? "Yes" : "No")}");
}