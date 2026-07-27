draw_set_font(Font1);
draw_set_halign(fa_left);
draw_set_valign(fa_middle);

for (var i = 0; i < array_length(options); i++) {
	var _y = panel_y + i * option_spacing;
	draw_set_color((i == selected_index) ? global.c_ltyellow : c_white);
	draw_text(panel_x, _y, (i == selected_index ? "> " : "  ") + options[i]);
}

draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);