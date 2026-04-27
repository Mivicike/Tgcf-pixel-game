// Close inventory with I (toggle handled by obj_XieLian) or Escape
if (keyboard_check_pressed(vk_escape)) {
    instance_destroy();
    exit;
}

var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);

hovered_slot = -1;

for (var row = 0; row < INVENTORY_ROWS; row++) {
    for (var col = 0; col < INVENTORY_COLS; col++) {
        var sx = grid_origin_x + col * (slot_w + padding);
        var sy = grid_origin_y + row * (slot_h + padding);

        if (point_in_rectangle(mx, my, sx, sy, sx + slot_w, sy + slot_h)) {
            hovered_slot = row * INVENTORY_COLS + col;
        }
    }
}