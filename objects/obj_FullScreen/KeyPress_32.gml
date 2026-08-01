if (instance_exists(obj_XieLian) && obj_XieLian.movement_locked) {
	exit;
}
if (window_get_fullscreen()){
	window_set_fullscreen(false) ;
} else {
	window_set_fullscreen(true) ;
}