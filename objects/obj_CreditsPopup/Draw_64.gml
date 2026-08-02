draw_set_alpha(0.70);
draw_set_color(c_black);
draw_rectangle(0, 0, gui_w, gui_h, false);
draw_set_alpha(1);

draw_set_font(Font1);
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_set_color(global.c_ltyellow);

for (var i = 0; i < array_length(credits_lines); i++) {
    var _line_y = visible_top - scroll_y + i * line_height;
    if (_line_y + line_height >= visible_top && _line_y <= visible_bottom) {
        draw_text(gui_w / 2, _line_y, credits_lines[i]);
    }
}

draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);