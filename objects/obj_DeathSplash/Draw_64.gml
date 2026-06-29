var scale_x = display_get_gui_width() / sprite_get_width(sprite_index);
var scale_y = display_get_gui_height() / sprite_get_height(sprite_index);

draw_sprite_ext(sprite_index, image_index, 0, 0, scale_x, scale_y, 0, c_white, 1);