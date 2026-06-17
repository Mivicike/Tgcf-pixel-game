// var w =  * img_scale_x;
// var h =  * img_scale_y;

hover = scr_IsMouseOverGUI(x - sprite_xoffset, y - sprite_yoffset, sprite_width, sprite_height);
show_debug_message($"Button at ({x}, {y}) with size ({sprite_width}, {sprite_height}) is hovered: {hover}. Scale factors: ({image_xscale}, {image_yscale})");
if (hover && mouse_check_button_pressed(mb_left))
{
    if (target_room != noone)
    {
        // Clear up
        instance_destroy(obj_DeathSplash);
        instance_destroy();

        room_goto(target_room);
    }
}
