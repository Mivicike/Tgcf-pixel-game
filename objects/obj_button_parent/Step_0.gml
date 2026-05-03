var w = sprite_width * img_scale_x;
var h = sprite_height * img_scale_y;

hover = point_in_rectangle(
    mouse_x, mouse_y,
    x - w/2, y - h/2,
    x + w/2, y + h/2
);

if (hover && mouse_check_button_pressed(mb_left))
{
    if (target_room != noone)
    {
        room_goto(target_room);
    }
}