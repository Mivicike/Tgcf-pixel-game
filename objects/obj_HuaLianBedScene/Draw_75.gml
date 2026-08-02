switch (story_step) {
	case 0:
	case 1:
		draw_sprite_ext(spr_PuqiShrine_HuaLian_1, 0, display_get_gui_width() / 2, display_get_gui_height() / 2, 2, 2, 0, c_white, fade_alpha);
		break;
	case 2:
		draw_sprite_ext(spr_PuqiShrine_HuaLian_2, 0, display_get_gui_width() / 2, display_get_gui_height() / 2, 2, 2, 0, c_white, 1);
		break;
	case 2.5:
	draw_set_color(c_black);
	draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);
	draw_sprite_ext(spr_PuqiShrine_HuaLian_2, 0, display_get_gui_width() / 2, display_get_gui_height() / 2, 2, 2, 0, c_white, fade_alpha);
	break;
case 2.75:
	draw_set_color(c_black);
	draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);
	draw_sprite_ext(spr_PuqiShrine_HuaLian_3, 0, display_get_gui_width() / 2, display_get_gui_height() / 2, 2, 2, 0, c_white, sprite3_alpha);
	break;
}