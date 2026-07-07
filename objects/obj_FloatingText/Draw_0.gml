var _t = clamp(timer / life_time, 0, 1);
var _alpha = 1 - _t;

draw_set_font(Font1_Smaller);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(color);
draw_set_alpha(_alpha);
draw_text(x, y, text);
draw_set_alpha(1);
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);