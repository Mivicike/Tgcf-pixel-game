function SaveData() constructor {
    // Player
    player = {
        hp         : 100,
        max_hp     : 100,
        room       : room_name(room),
        x          : 0,
        y          : 0,
        items      : [],       // array of item IDs or structs
        flags      : {}        // misc booleans: has_sword, etc.
    };

    // World state
    world = {
        dead_enemies  : {},    // keyed by unique enemy ID → true
        puzzles       : {},    // keyed by puzzle ID → completed bool or state
        doors         : {},    // door ID → open/locked state
        collectibles  : {}     // collectible ID → picked up bool
    };

    // Meta
    meta = {
        timestamp     : string(current_time),
        play_time_sec : 0,
        save_slot     : 1
    };

    // save_game(slot)
    function save_game(slot) {
        // Populate from live state
        global.save_data.player.hp   = obj_player.hp;
        global.save_data.player.room = room_get_name(room);
        global.save_data.player.x    = obj_player.x;
        global.save_data.player.y    = obj_player.y;
        global.save_data.player.items = array_create_from_list(obj_player.inventory);
        global.save_data.meta.timestamp = string(current_time);

        var _json = json_stringify(global.save_data, true); // true = pretty print
        var _path = "save_slot_" + string(slot) + ".json";
        var _file = file_text_open_write(working_directory + _path);
        file_text_write_string(_file, _json);
        file_text_close(_file);
    }

    /// load_game(slot)
    function load_game(slot) {
        var _path = working_directory + "save_slot_" + string(slot) + ".json";
        if (!file_exists(_path)) return false;

        var _file = file_text_open_read(_path);
        var _json  = "";
        while (!file_text_eof(_file)) {
            _json += file_text_read_string(_file);
            file_text_readln(_file);
        }
        file_text_close(_file);

        global.save_data = json_parse(_json);
        return true;
    }
}