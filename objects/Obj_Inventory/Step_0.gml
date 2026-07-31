if (instance_exists(obj_HelpPopup)) exit;
if (keyboard_check_pressed(vk_escape)) {
	scr_Inventory_Close();
	exit;
}

// Mouse position
var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);

drag_x = mx;
drag_y = my;

// Which slot is the mouse over
hovered_slot = -1;
for (var row = 0; row < INVENTORY_ROWS; row++) {
	for (var col = 0; col < INVENTORY_COLS; col++) {
		var index  = row * INVENTORY_COLS + col;
		var sx = grid_origin_x + col * (slot_w + padding);
		var sy = grid_origin_y + row * (slot_h + padding);
		if (point_in_rectangle(mx, my, sx, sy, sx + slot_w, sy + slot_h)) {
			hovered_slot = index;
		}
	}
}

if (variable_global_exists("sanlang_gift_mode") && global.sanlang_gift_mode) {
	if (mouse_check_button_pressed(mb_left) && hovered_slot != -1 && !inventory_slot_empty(hovered_slot)) {
		scr_SanLang_OnGiftItem(hovered_slot);
	}
	exit;
}

if (variable_global_exists("kitchen_mode") && global.kitchen_mode) {
	if (mouse_check_button_pressed(mb_left) && hovered_slot != -1 && !inventory_slot_empty(hovered_slot)) {
		scr_Kitchen_OnAddItem(hovered_slot);
	}
	exit;
}
if (global.sanlang_feed_mode) {
	if (mouse_check_button_pressed(mb_left) && hovered_slot != -1 && !inventory_slot_empty(hovered_slot)) {
		scr_SanLang_OnFeedItem(hovered_slot);
	}
	exit;
}

// Rightclick drag
if (mouse_check_button_pressed(mb_right) && drag_slot != -1 && drag_item.count > 1) {
	rclick_painting = true;
	rclick_items_placed = 0;
	ds_list_clear(rclick_painted_slots);
}

if (rclick_painting) {
	if (hovered_slot != -1 && drag_item.count > 0) {
		var p_slot = global.inventory[hovered_slot];
		var already_painted = (ds_list_find_index(rclick_painted_slots, hovered_slot) != -1);
		if (!already_painted && (p_slot.item_name == "" || p_slot.item_name == drag_item.item_name) && p_slot.count < STACK_MAX) {
			ds_list_add(rclick_painted_slots, hovered_slot);

			global.inventory[hovered_slot].sprite = drag_item.sprite;
			global.inventory[hovered_slot].item_name = drag_item.item_name;
			global.inventory[hovered_slot].count += 1;

			global.inventory[drag_slot].count -= 1;
			if (global.inventory[drag_slot].count <= 0) {
				global.inventory[drag_slot].item_name = "";
				global.inventory[drag_slot].sprite = undefined;
				drag_slot = -1;
				drag_item = undefined;
				rclick_painting = false;
			}
		}
	}
}

if (mouse_check_button_released(mb_right) && rclick_painting) {
	rclick_painting = false;
	ds_list_clear(rclick_painted_slots);
	if (drag_item.count <= 0)
		drag_slot = -1;
}

// Right click split stack
if (mouse_check_button_pressed(mb_right) && !rclick_painting && drag_slot == -1) {
	if (hovered_slot != -1) {
		inventory_split_stack(hovered_slot);
	}
}

// Left-click
if (mouse_check_button_pressed(mb_left)) {
	var now = current_time;
	var dbl_ms = 350;
	var is_double_click = (hovered_slot != -1 && hovered_slot == last_click_slot && (now - last_click_time) < dbl_ms);

	if (is_double_click) {
		var target = global.inventory[hovered_slot];
		if (target.item_name != "") {
			if (drag_item != undefined && drag_slot != -1) {
				global.inventory[drag_slot].item_name = drag_item.item_name;
				global.inventory[drag_slot].sprite = drag_item.sprite;
				global.inventory[drag_slot].count = drag_item.count;
				drag_slot = -1;
			}

			for (var index = 0; index < INVENTORY_SIZE; index++) {
				if (index == hovered_slot)
					continue;

				var slot = global.inventory[index];
				if (slot.item_name == target.item_name && target.count < STACK_MAX) {
					var _space = STACK_MAX - target.count;
					var _move  = min(_space, slot.count);
					target.count += _move;
					slot.count -= _move;
					if (slot.count <= 0) {
						slot.item_name = "";
						slot.count = 0;
						slot.sprite = undefined;
					}

					if (target.count >= STACK_MAX)
						break;
				}
			}
		}
		last_click_slot = -1;
		last_click_time = -9999;

	} else if (drag_slot == -1) {
		// Pick up stack
		if (hovered_slot != -1 && !inventory_slot_empty(hovered_slot)) {
			drag_slot = hovered_slot;
			drag_item = global.inventory[hovered_slot];
			audio_play_sound(snd_Klick, 1, false);
		}
		last_click_slot = hovered_slot;
		last_click_time = now;

	} else {
		if (hovered_slot != -1) {
			var target = global.inventory[hovered_slot];

			if (target.item_name == "") {
				target.item_name = drag_item.item_name;
				target.count = drag_item.count;
				target.sprite = drag_item.sprite;

				inventory_clear_slot(drag_slot);
				drag_item = undefined;
				drag_slot = -1;

			} else if (target.item_name == drag_item.item_name) {
				var space = STACK_MAX - target.count;
				var move  = min(space, drag_item.count);
				target.count += move;
				drag_item.count -= move;
				if (drag_item.count <= 0) {
					drag_item = undefined;
					drag_slot = -1;
				}

			} else {
				var item_a = variable_clone(target);
				var item_b = variable_clone(drag_item);

				global.inventory[hovered_slot] = item_b;
				global.inventory[drag_slot] = item_a;

				drag_item = item_a;
			}
		} else {
			global.inventory[drag_slot].item_name = drag_item.item_name;
			global.inventory[drag_slot].sprite = drag_item.sprite;
			global.inventory[drag_slot].count = drag_item.count;
			drag_slot = -1;
			drag_item = undefined;
		}

		last_click_slot = hovered_slot;
		last_click_time = now;
	}
}