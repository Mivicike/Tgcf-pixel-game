draw_set_alpha(0.75);
draw_set_color(c_black);
draw_rectangle(0, 0, gui_w, gui_h, false);
draw_set_alpha(1);

draw_set_font(Font1);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_white);
draw_text(gui_w / 2, gui_h / 2, help_message);
draw_set_halign(fa_left);
draw_set_valign(fa_top);