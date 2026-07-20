if (intro_step == 5) {
    draw_set_color(c_black);
    draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);

    draw_sprite_ext(
        spr_Illustation_XieLianFell,
        0,
        display_get_gui_width() / 2,
        display_get_gui_height() / 2,
        2, 2, 0, c_white, 1
    );
}