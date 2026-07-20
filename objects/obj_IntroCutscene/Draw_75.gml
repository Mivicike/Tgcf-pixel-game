if (fade_alpha > 0 && intro_step < 5) {
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
        2, 2, 0, c_white, cutscene_alpha
    );
}

if (intro_step == 4) {
    draw_sprite_ext(
        spr_Illustation_XieLianFell,
        0,
        display_get_gui_width() / 2,
        display_get_gui_height() / 2,
        2, 2, 0, c_white, illustration_alpha
    );
}
if (intro_step == 2.5) {
    draw_set_font(Font1);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_set_color(c_white);
    draw_set_alpha(text_alpha);
	
    var center_x = display_get_gui_width() / 2;
    var center_y = display_get_gui_height() / 2;
    var max_width = display_get_gui_width() * 0.8;
	
    draw_text_ext(center_x, center_y, intro_messages[current_msg], -1, max_width);
    draw_set_alpha(1);
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
}