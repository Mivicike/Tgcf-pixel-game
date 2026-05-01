if (image_index >= 2) { // only deal damage after frame 2
    obj_XieLian.hp -= damage;
	show_debug_message(obj_XieLian.hp)
    instance_destroy();
}