if (instance_number(obj_init) >= 2) {
    instance_destroy();
    exit;
}

randomize();

gpu_set_texfilter(false);
display_set_gui_size(840, 560)

// Disable texture interpolation to prevent black lines between sprites/tiles
if (instance_number(obj_init) >= 2) {
    instance_destroy();
    exit;
}

gpu_set_texfilter(false);
display_set_gui_size(840, 560)

// San Lang
global.dialog_active = false;
global.sanlang_feed_mode = false;
global.sanlang_gift_mode = false;
global.suppress_room_music = false;
global.holding_hands = false;

//Kitchen
global.kitchen_mode = false;

// inventory
inventory_init();
global.inventory_just_closed = false;

// your moneyy
global.starting_yuan = 0;
global.yuan = global.starting_yuan;

/// @type {Struct.SaveData}
global.save_data = undefined;
global.current_save_slot = 0;
global.auto_save = true;

//Custom colors
global.c_dkorange = make_color_rgb(71, 33, 11);
global.c_ltyellow = make_color_rgb(245, 232, 193);
global.c_beige = make_color_rgb(209, 168, 136);

// Create the managers
instance_create_depth(0, 0, -9999, obj_CameraManager);
instance_create_depth(0, 0, -9999, obj_DialogueManager);
instance_create_depth(0, 0, -9999, obj_Butterfly);

//Ghost encounter
global.ghost_driver_dialogue_shown = false;