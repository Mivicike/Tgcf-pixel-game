
var spacing = 22; // Spacing
var start_x = 14;
var start_y = 14;

//empty heart
for (var i = 0; i < max_liv; i++) {
    draw_sprite_ext(Spr_HeartEmpty, 0, start_x + i * spacing, start_y, 2, 2, 0, c_white, 1);
}

// Full heart
for (var i = 0; i < liv; i++) {
    draw_sprite_ext(Spr_HeartFull, 0, start_x + i * spacing, start_y, 2, 2, 0, c_white, 1);
}
