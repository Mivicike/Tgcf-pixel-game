if (fade_alpha > 0) {
    draw_set_alpha(fade_alpha);
    draw_set_color(c_black);
    draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);
    draw_set_alpha(1);
}

if (intro_step == 3 && cutscene_playing) {
    draw_sprite_ext(
        spr_Cutscene_XielianFalling,
        floor(cutscene_frame),
        display_get_gui_width() / 2,
        display_get_gui_height() / 2,
        2, 2, 0, c_white, 1
    );
}