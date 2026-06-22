// Disable texture interpolation to prevent black lines between sprites/tiles
gpu_set_texfilter(false);
display_set_gui_size(840, 560)

global.dialog_active = false;

// inventory
inventory_init();
global.inventory_just_closed = false;

// your moneyy
global.kronor = 100;

//Custom colors
global.c_dkorange = make_color_rgb(71, 33, 11);
global.c_ltyellow = make_color_rgb(245, 232, 193);
global.c_beige = make_color_rgb(209, 168, 136);

// Create the managers
instance_create_depth(0, 0, -9999, obj_CameraManager);
instance_create_depth(0, 0, -9999, obj_DialogueManager);