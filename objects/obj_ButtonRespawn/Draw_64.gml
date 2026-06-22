// Make button appear lighter when selected
var col = hover ? make_color_rgb(245, 232, 193) : make_color_rgb(209, 168, 136);
draw_sprite_ext(Spr_Button, 0, x, y, image_xscale, image_yscale, 0, col, 1);

draw_set_color(c_red);
draw_set_color(c_white);

// Font
draw_set_font(Font1);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_white);

// Text
draw_text(x, y, text);

//so it dosen't affect the dialog text
draw_set_font(-1);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);