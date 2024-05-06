
//states skripts
switch(state){
	 case PLAYERSTATE.FREE		:	scr_PlayerStateFree(); break;
}


//camera
halfview_Width = camera_get_view_width(view_camera[0]) / 2;
halfview_Height = camera_get_view_height(view_camera[0]) / 2;

camera_set_view_pos(view_camera[0], x - halfview_Width, y - halfview_Height);

