if (instance_exists(Obj_Inventory)) {
	depth = 100000;
} else {
	depth = -9000;
}
if (instance_exists(Obj_Inventory)) exit;

bg_anim_index += bg_anim_speed;
if (bg_anim_index >= sprite_get_number(spr_KitchenBackground)) {
	bg_anim_index -= sprite_get_number(spr_KitchenBackground);
}

pot_anim_index += pot_anim_speed;

var _mx = device_mouse_x_to_gui(0);
var _my = device_mouse_y_to_gui(0);

hovered_spice = -1;
if (!dragging) {
	for (var i = 0; i < array_length(spices); i++) {
		var _s = spices[i];
		var _sx = bg_x + _s.x * scale;
		var _sy = bg_y + _s.y * scale;
		var _hw = sprite_get_width(_s.sprite) * scale / 2;
		var _hh = sprite_get_height(_s.sprite) * scale / 2;
		if (point_in_rectangle(_mx, _my, _sx - _hw, _sy - _hh, _sx + _hw, _sy + _hh)) {
			hovered_spice = i;
		}
	}
}

if (!dragging && hovered_spice != -1 && mouse_check_button_pressed(mb_left)) {
	dragging = true;
	drag_type = spices[hovered_spice].type;
	drag_sprite = scr_Kitchen_SpiceGrabSprite(drag_type);
}

if (dragging && mouse_check_button_released(mb_left)) {
	dragging = false;

	var _pot_gui_x = bg_x + pot_x * scale;
	var _pot_gui_y = bg_y + pot_y * scale;
	var _over_pot = point_distance(_mx, _my, _pot_gui_x, _pot_gui_y) <= pot_hit_radius * scale;

	if (_over_pot) {
	if (drag_type == KITCHEN_SPICE.SALT) {
		has_spice = true;
	} else {
		var _color = scr_Kitchen_SpiceColor(drag_type);
		scr_Kitchen_AddPotLayer(pot_layers, _color);
		has_spice = true;
	}
}

	drag_type = -1;
	drag_sprite = -1;
}

var _ready = has_spice && has_item;
if (_ready && !instance_exists(obj_KitchenDoneButton)) {
	done_button = instance_create_depth(bg_x + 245 * scale, bg_y + 260 * scale, -9001, obj_KitchenDoneButton);
	done_button.owner_popup = id;
}