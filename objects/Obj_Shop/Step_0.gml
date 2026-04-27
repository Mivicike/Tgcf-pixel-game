// Obj_Shop Step

// Close on Escape or Z (same key as dialogue skip)
if (keyboard_check_pressed(vk_escape) || keyboard_check_pressed(ord("Z"))) {
    instance_destroy();
    exit;
}

var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);

hovered_slot = -1;

for (var i = 0; i < num_items; i++) {
    var sx = grid_origin_x + i * (slot_w + padding);
    var sy = grid_origin_y;
    if (point_in_rectangle(mx, my, sx, sy, sx + slot_w, sy + slot_h)) {
        hovered_slot = i;

        // Buy on left click
        if (mouse_check_button_pressed(mb_left)) {
            var item = shop_items[i];
            if (global.gold >= item.price) {
                var result = inventory_add_item(item.name);
                if (result != -1) {
                    global.gold -= item.price;
                    feedback_msg = "Bought " + item.label + "!";
                } else {
                    feedback_msg = "Inventory full!";
                }
            } else {
                feedback_msg = "Not enough gold!";
            }
            feedback_timer = 120;
        }
    }
}

if (feedback_timer > 0) feedback_timer--;