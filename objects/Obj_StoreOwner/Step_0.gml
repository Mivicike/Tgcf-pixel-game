// Kolla om spelaren är inom 20 pixlar
if (distance_to_object(obj_XieLian) <= interaction_distance) {
    player_near = true;
} else {
    player_near = false;
}


if (player_near && keyboard_check_pressed(ord("Z")) && !instance_exists(Obj_Dialogue)) {
   var dlg = instance_create_layer(x, y, layer, Obj_Dialogue);
    dlg.npc_x = x;
    dlg.npc_y = y;
}
