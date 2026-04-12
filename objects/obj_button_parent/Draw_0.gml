// Make button appear lighter when selected
var col = hover ? make_color_rgb(255, 255, 255) : make_color_rgb(150, 150, 150);

draw_sprite_ext(
    Spr_Button,
    0,
    x,
    y,
    img_scale_x,
    img_scale_y,
    0,
    col,
    1
);

// Font
draw_set_font(Font1);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_white);

// Text
draw_text(x, y, text);