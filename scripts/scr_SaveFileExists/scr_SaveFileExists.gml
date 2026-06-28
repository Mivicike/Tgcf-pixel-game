function scr_SaveFileExists(save_slot) {
    var _dir  = game_save_id;
    if (string_char_at(_dir, string_length(_dir)) != "/") _dir += "/";

    var _path = _dir + "save_slot_" + string(save_slot) + ".json";
    show_debug_message($"Checking save path: {_path}");
    return file_exists(_path);
}