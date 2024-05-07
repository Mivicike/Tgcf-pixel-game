//camera 
halfview_width = camera_get_view_width(view_camera[0]) / 2;
halfview_height = camera_get_view_height(view_camera[0]) / 2;

image_speed = 0;
attack_state = false;

//walk speed horizontal and vertikal
hsp =  0; 
vsp = 0; 
spd = 1;



//In future we can use different states to ease animation and states changes
// State Free - idle, moving, atacking

state = PLAYERSTATE.FREE

enum PLAYERSTATE{
	FREE,
}


