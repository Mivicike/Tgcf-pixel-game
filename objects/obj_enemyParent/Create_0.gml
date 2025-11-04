hp = 3;
damage = 1;
distance_to_player = 30;
move_speed = 0.5;

target_x = x;
target_y = y;

alarm[0] = 60;

tilemap =  layer_tilemap_get_id("Tiles_Col")

// Knockback
kb_x = 1;
kb_y = 1;
knockback_speed = 1;
kb_timer = 0;