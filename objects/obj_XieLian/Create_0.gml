//camera 
halfview_width = camera_get_view_width(view_camera[0]) / 2;
halfview_height = camera_get_view_height(view_camera[0]) / 2;

image_speed = 0;
attack_state = false;

//walk speed horizontal and vertical
hspd =  0; 
vspd = 0; 
walk_speed = 3;

//collision speed
collision_speed = walk_speed + 2;



//In future we can use different states to ease animation and states changes
// State Free - idle, moving, atacking

state = PLAYERSTATE.FREE

enum PLAYERSTATE{
	FREE,
}


