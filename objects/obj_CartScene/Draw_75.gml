if (cart_scene_step == 2 && cutscene_playing) {
    draw_set_color(c_black);
    draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);

    draw_sprite_ext(
        spr_Cutscene_Cart,
        floor(cutscene_frame),
        display_get_gui_width() / 2,
        display_get_gui_height() / 2,
        2, 2, 0, c_white, cutscene_alpha
    );
}