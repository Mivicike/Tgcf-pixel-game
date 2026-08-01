var _dx = gui_w * 0.2;
var _dy = gui_h * 0.4;
var _boxw = gui_w * 0.6;
var _boxh = 150;

draw_sprite_stretched(Spr_DialogueBox, 0, _dx, _dy, _boxw, _boxh);

draw_set_font(Font1);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_maroon);
var _cursor = (current_time % 1000 < 500) ? "|" : "";

draw_text_ext(_dx + 30, _dy - 10, wish_text + _cursor, -1, _boxw - 60);