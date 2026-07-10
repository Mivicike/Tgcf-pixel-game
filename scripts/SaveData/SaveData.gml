function SaveData() constructor {
    // Player
    player = {
        hp : 0,
        max_hp : 0,
        room : undefined,
        x : 0,
        y : 0,
        yuan : 0,
        items : [], // array of item IDs or structs
        flags : {} // misc booleans: has_sword, etc.
    };

    // World state
    world = {
        dead_enemies : {}, // keyed by unique enemy ID → true
        puzzles : {},  // keyed by puzzle ID → completed bool or state
        doors : {}, // door ID → open/locked state
        collectibles : {}, // collectible ID → picked up bool
        objects : {} // object ID → state (e.g., lit/unlit for candles)
    };

    // Meta
    meta = {
        timestamp : string(current_time),
        play_time_sec : 0,
        save_slot : 1
    };
}