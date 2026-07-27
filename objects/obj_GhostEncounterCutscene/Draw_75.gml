draw_set_color(c_black);
draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);

draw_set_font(Font1);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_white);
draw_set_alpha(text_alpha);

var center_x = display_get_gui_width() / 2;
var center_y = display_get_gui_height() / 2;
var max_width = display_get_gui_width() * 0.8;

draw_text_ext(center_x, center_y, messages[current_msg], -1, max_width);
draw_set_alpha(1);
draw_set_halign(fa_left);
draw_set_valign(fa_top);