draw_set_font(Font1)
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

        if (mouse_check_button_pressed(mb_left)) {
            var item = shop_items[i];
            if (global.kronor >= item.price) {
                // inventory_add_item now takes (name, count); count defaults to 1
                var result = inventory_add_item(item.name, 1);
                if (result != -1) {
                    global.kronor  -= item.price;
                    feedback_msg  = "Bought " + item.label + "!";
                } else {
                    feedback_msg = "Inventory full!";
                }
            } else {
                feedback_msg = "Not enough kronor!";
            }
            feedback_timer = 120;
        }
    }
}

if (feedback_timer > 0) feedback_timer--;
