if (image_index >= 2) { // only deal damage after frame 2
    obj_player.hp -= damage;
    instance_destroy();
}