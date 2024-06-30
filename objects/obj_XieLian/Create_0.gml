//camera 
halfview_width = camera_get_view_width(view_camera[0]) / 2;
halfview_height = camera_get_view_height(view_camera[0]) / 2;

image_speed = 0;
save_sprite = Xielianwalkdown

//walk speed horizontal and vertical
hspd =  0; 
vspd = 0; 
walk_speed = 1;

//dash speed and dash check
dash = false
dash_speed = 3;
dash_dir = 270;
dash_cooldown = 0;

//collision speed
collision_speed = walk_speed + 2;

collision_enemy = undefined;

my_direction = 180

//hurtbox
hurtbox = hurtbox_create(7,14,-10,-21)

//lock movement
movement_locked = false;

//In future we can use different states to ease animation and states changes
// State Free - idle, moving, atacking

state = PLAYERSTATE.FREE

enum PLAYERSTATE{
	FREE,
	ATTACK,
	DASH,
}


