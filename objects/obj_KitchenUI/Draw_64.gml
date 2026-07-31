draw_sprite_ext(spr_KitchenBackground, floor(bg_anim_index), bg_x, bg_y, scale, scale, 0, c_white, 1);

var _pot_gui_x = bg_x + pot_x * scale;
var _pot_gui_y = bg_y + pot_y * scale;

if (array_length(pot_layers) == 0) {
	var _f = floor(pot_anim_index) mod sprite_get_number(spr_KitchenPot_Clear);
	draw_sprite_ext(spr_KitchenPot_Clear, _f, _pot_gui_x, _pot_gui_y, scale, scale, 0, c_white, 1);
} else {
	for (var i = 0; i < array_length(pot_layers); i++) {
		var _spr = scr_Kitchen_PotSpriteForColor(pot_layers[i]);
		var _f = floor(pot_anim_index) mod sprite_get_number(_spr);
		draw_sprite_ext(_spr, _f, _pot_gui_x, _pot_gui_y, scale, scale, 0, c_white, 1);
	}
}

for (var i = 0; i < array_length(spices); i++) {
	var _s = spices[i];
	var _sx = bg_x + _s.x * scale;
	var _sy = bg_y + _s.y * scale;
	var _col = (i == hovered_spice) ? make_color_rgb(140, 140, 140) : c_white;
	draw_sprite_ext(_s.sprite, 0, _sx, _sy, scale, scale, 0, _col, 1);
}

if (dragging) {
	draw_sprite_ext(drag_sprite, 0, device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), scale, scale, 0, c_white, 1);
}
if (show_intro_message) {
	draw_set_alpha(0.20);
	draw_set_color(c_black);
	draw_rectangle(bg_x, bg_y, bg_x + bg_w, bg_y + bg_h, false);
	draw_set_alpha(1);

	draw_set_font(Font1);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_set_color(c_white);
	draw_text_ext(bg_x + bg_w / 2, bg_y + bg_h / 2, intro_message, -1, bg_w - 80);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
}