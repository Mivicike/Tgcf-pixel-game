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