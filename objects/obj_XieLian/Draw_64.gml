
var spacing = 22; // Spacing
var start_x = 14;
var start_y = 14;

//empty heart
for (var i = 0; i < liv; i++) {
    draw_sprite_ext(Spr_HeartEmpty, 0, start_x + i * spacing, start_y, 2, 2, 0, c_white, 1);
}

// Full heart
for (var i = 0; i < hp; i++) {
    draw_sprite_ext(Spr_HeartFull, 0, start_x + i * spacing, start_y, 2, 2, 0, c_white, 1);
}


// Draw debug info
if (debug_enabled) {
	draw_set_colour(c_white);
    var debug_text = "State: " + string(state) + "\n" +
                     "HSPD: " + string(hsp) + "\n" +
                     "VSPD: " + string(vsp) + "\n" +
                     "Position: (" + string(x) + ", " + string(y) + ")\n" +
                     "Dash: " + string(dash) + "\n" +
                     "Dash Cooldown: " + string(dash_cooldown) + "\n" +
                     "Attack Counter: " + string(attack_counter) + "\n" +
                     "Last Attack Time: " + string(last_attack_time) + "\n" +
                     "Attack Reset Time: " + string(attack_reset_time) + "\n" +
                     "Knockback X: " + string(kb_x) + "\n" +
                     "Knockback Y: " + string(kb_y);

    draw_text(10, 50, debug_text);
}
//Help
if (!movement_locked || state == PLAYERSTATE.DASH) {
	draw_set_font(Font1);
	draw_set_halign(fa_right);
	draw_set_valign(fa_top);
	draw_set_color(help_hover ? global.c_ltyellow : c_white);
	draw_text(display_get_gui_width() - 14, 14, "H = Help");
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_set_color(c_white);

//Quest
	var _quest_text = scr_GetActiveQuestText();
	if (_quest_text != "") {
		draw_set_font(Font1);
		var _help_w = string_width("H = Help");
		var _help_h = string_height("H = Help");

		var _icon_scale = 2;
		var _icon_w = sprite_get_width(spr_Quest) * _icon_scale;
		var _icon_h = sprite_get_height(spr_Quest) * _icon_scale;
		var _icon_x = display_get_gui_width() - 14 - _icon_w / 2;
		var _icon_y = 14 + _help_h + 16 + _icon_h / 2;

		if (quest_slide_amount > 0.01) {
			draw_set_font(Font1_Smaller);
			var _panel_w = string_width(_quest_text) + 20;
			var _panel_h = string_height(_quest_text) + 16;
			var _panel_right = _icon_x - _icon_w / 2;
			var _panel_left = _panel_right - _panel_w * quest_slide_amount;

            draw_set_alpha(0.5 * quest_slide_amount);
			draw_set_color(make_color_rgb(133, 78, 12));
			draw_rectangle(_panel_left, _icon_y - _panel_h / 2, _panel_right, _icon_y + _panel_h / 2, false);
			draw_set_alpha(quest_slide_amount);
			draw_set_halign(fa_right);
			draw_set_valign(fa_middle);
			draw_set_color(c_white);
            draw_text(_panel_right - 10, _icon_y, _quest_text);
			draw_set_alpha(1);
            draw_set_halign(fa_left);
			draw_set_valign(fa_top);
		}

		draw_sprite_ext(spr_Quest, 0, _icon_x, _icon_y, _icon_scale, _icon_scale, 0, c_white, 1);
	}
}
if (global.holding_hands) {
	draw_set_font(Font1);
	draw_set_halign(fa_left);
	draw_set_valign(fa_middle);
	draw_set_color(global.c_ltyellow);
	draw_text(20, display_get_gui_height() - 110, "Press Z to stop holding hands");
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_set_color(c_white);
}