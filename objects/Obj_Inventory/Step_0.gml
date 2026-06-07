// Close inventory on Escape
if (keyboard_check_pressed(vk_escape)) {
    if (drag_slot != -1) {
        global.inventory[drag_slot].item_name = drag_item;
        global.inventory[drag_slot].count     = drag_count;
        drag_slot = -1;
    }
    rclick_painting = false;
    ds_list_clear(rclick_painted_slots);
    global.inventory_just_closed = true;
    instance_destroy();
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
        var i  = row * INVENTORY_COLS + col;
        var sx = grid_origin_x + col * (slot_w + padding);
        var sy = grid_origin_y + row * (slot_h + padding);
        if (point_in_rectangle(mx, my, sx, sy, sx + slot_w, sy + slot_h)) {
            hovered_slot = i;
        }
    }
}

// Right-click drag: start painting
if (mouse_check_button_pressed(mb_right) && drag_slot != -1 && drag_count > 1) {
    rclick_painting     = true;
    rclick_items_placed = 0;
    ds_list_clear(rclick_painted_slots);
}

// While painting, place one item per newly entered slot
if (rclick_painting) {
    if (hovered_slot != -1 && drag_count > 0) {
        var _pslot = global.inventory[hovered_slot];
        var _already_painted = (ds_list_find_index(rclick_painted_slots, hovered_slot) != -1);
        if (!_already_painted
            && (_pslot.item_name == "" || _pslot.item_name == drag_item)
            && _pslot.count < STACK_MAX) {
            ds_list_add(rclick_painted_slots, hovered_slot);
            _pslot.item_name     = drag_item;
            _pslot.count        += 1;
            rclick_items_placed += 1;
            drag_count          -= 1;
        }
    }
}

if (mouse_check_button_released(mb_right) && rclick_painting) {
    rclick_painting = false;
    ds_list_clear(rclick_painted_slots);
    if (drag_count <= 0) drag_slot = -1;
}

// Right-click idle: split stack
if (mouse_check_button_pressed(mb_right) && !rclick_painting && drag_slot == -1) {
    if (hovered_slot != -1) {
        inventory_split_stack(hovered_slot);
    }
}

// Left-click
if (mouse_check_button_pressed(mb_left)) {

    var _now    = current_time;
    var _dbl_ms = 350;
    var _is_double_click = (
        hovered_slot != -1
        && hovered_slot == last_click_slot
        && (_now - last_click_time) < _dbl_ms
    );

    if (_is_double_click) {
        // Double-click: consolidate matching stacks into this slot
        var _target = global.inventory[hovered_slot];
        if (_target.item_name != "") {
            for (var _g = 0; _g < INVENTORY_SIZE; _g++) {
                if (_g == hovered_slot) continue;
                var _src = global.inventory[_g];
                if (_src.item_name == _target.item_name && _target.count < STACK_MAX) {
                    var _space = STACK_MAX - _target.count;
                    var _move  = min(_space, _src.count);
                    _target.count += _move;
                    _src.count    -= _move;
                    if (_src.count <= 0) {
                        _src.item_name = "";
                        _src.count     = 0;
                    }
                    if (_target.count >= STACK_MAX) break;
                }
            }
        }
        // Reset double-click state so a third click doesn't re-trigger
        last_click_slot = -1;
        last_click_time = -9999;

    } else if (drag_slot == -1) {
        // Pick up stack
        if (hovered_slot != -1 && !inventory_slot_empty(hovered_slot)) {
            drag_slot  = hovered_slot;
            drag_item  = global.inventory[hovered_slot].item_name;
            drag_count = global.inventory[hovered_slot].count;
            global.inventory[hovered_slot].item_name = "";
            global.inventory[hovered_slot].count     = 0;
            audio_play_sound(snd_ButtonPress, 1, false); // pickup sound
        }
        // Always record for double-click detection (even on empty slot clicks)
        last_click_slot = hovered_slot;
        last_click_time = _now;

    } else {
        // Already holding something – place / merge / swap
        if (hovered_slot != -1) {
            var target = global.inventory[hovered_slot];

            if (target.item_name == "") {
                // Empty slot – place whole stack
                target.item_name = drag_item;
                target.count     = drag_count;
                drag_slot        = -1;

            } else if (target.item_name == drag_item) {
                // Same item – merge
                var space = STACK_MAX - target.count;
                var move  = min(space, drag_count);
                target.count += move;
                drag_count   -= move;
                if (drag_count <= 0) drag_slot = -1;
                // If stack full, remainder stays in hand

            } else {
                // Different item – swap
                var tmp_name  = target.item_name;
                var tmp_count = target.count;
                target.item_name = drag_item;
                target.count     = drag_count;
                drag_item        = tmp_name;
                drag_count       = tmp_count;
            }
        } else {
            // Clicked outside grid – return item to original slot
            global.inventory[drag_slot].item_name = drag_item;
            global.inventory[drag_slot].count     = drag_count;
            drag_slot = -1;
        }

        last_click_slot = hovered_slot;
        last_click_time = _now;
    }
}