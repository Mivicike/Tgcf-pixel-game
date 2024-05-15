//camera 
halfview_width = camera_get_view_width(view_camera[0]) / 2;
halfview_height = camera_get_view_height(view_camera[0]) / 2;

image_speed = 0;
attack_state = false;

//walk speed horizontal and vertical
hspd =  0; 
vspd = 0; 
walk_speed = 1;

//collision speed
collision_speed = walk_speed + 2;

//layer name
layer_name = "xieLianLayer";
if (!layer_exists(layer_name)) {
    // Create the layer if it doesn't exist
    layer = layer_create(400, layer_name); // Create the layer off-screen
   // layer_depth = layer_get_highest_depth() + 1; // Set depth higher than existing layers
} else {
    // If the layer already exists, find its ID
    layer = layer_get_id(layer_name);
}

//In future we can use different states to ease animation and states changes
// State Free - idle, moving, atacking

state = PLAYERSTATE.FREE

enum PLAYERSTATE{
	FREE,
}


