//Background
draw_sprite_ext(Spr_InventoryBackground, 0, bg_x, bg_y, scale, scale, 0, c_white, 1);

//Slots 
draw_set_font(Font1);
for (var row = 0; row < INVENTORY_ROWS; row++) {
    for (var col = 0; col < INVENTORY_COLS; col++) {
        var i    = row * INVENTORY_COLS + col;
        var sx   = grid_origin_x + col * (slot_w + padding) + 15;
        var sy   = grid_origin_y + row * (slot_h + padding) + 35;
        var slot = global.inventory[i];
        // hovered or is the drag source
        var slot_col = c_white;
        if (i == hovered_slot)                 slot_col = make_color_rgb(245, 232, 193);
        if (drag_slot != -1 && i == drag_slot) slot_col = make_color_rgb(204, 137, 98);
        draw_sprite_ext(Spr_InventoryBox, 0, sx, sy, scale, scale, 0, slot_col, 1);
        // Draw item sprite (skip the drag source slot - it's being carried)
        if (slot.item_name != "" && i != drag_slot) {
            var item_spr = asset_get_index(slot.item_name);
            if (item_spr != -1) {
                var item_scale = scale * 1;
                var item_cx = sx + slot_w / 2 -35;
                var item_cy = sy + slot_h / 2 -37.5;
                draw_sprite_ext(item_spr, 0, item_cx, item_cy, item_scale, item_scale, 0, c_white, 1);
            }
            // Stack count badge (only show when count > 1)
            if (slot.count > 1) {
                draw_set_halign(fa_right);
                draw_set_valign(fa_bottom);
                draw_set_color(c_black);
                draw_text(sx + slot_w - 1, sy + slot_h - 1 + 1, string(slot.count));
                draw_set_color(c_white);
                draw_text(sx + slot_w - 1, sy + slot_h - 1, string(slot.count));
                draw_set_halign(fa_left);
                draw_set_valign(fa_top);
            }
        }
    }
}

//Drag ghost: item floating under the cursor
if (drag_slot != -1) {
    var ghost_spr = asset_get_index(drag_item);
    if (ghost_spr != -1) {
        var ghost_scale = scale * 1;
        draw_sprite_ext(ghost_spr, 0, drag_x -35, drag_y -37.5, ghost_scale, ghost_scale, 0, c_white, 0.8);
    }
    // Count badge on ghost
    if (drag_count > 1) {
        draw_set_halign(fa_right);
        draw_set_valign(fa_bottom);
        draw_set_color(c_black);
        draw_text(drag_x + slot_w / 2 - 1, drag_y + slot_h / 2 + 1, string(drag_count));
        draw_set_color(c_yellow);
        draw_text(drag_x + slot_w / 2 - 1, drag_y + slot_h / 2,     string(drag_count));
        draw_set_halign(fa_left);
        draw_set_valign(fa_top);
    }
}

//Hover tooltip
if (hovered_slot != -1 && drag_slot == -1) {
    var tip_slot = global.inventory[hovered_slot];
    if (tip_slot.item_name != "") {
        var tip_x = device_mouse_x_to_gui(0) + 8;
        var tip_y = device_mouse_y_to_gui(0) - 16;
        draw_set_color(make_color_rgb(143, 95, 67));
        draw_rectangle(tip_x - 2, tip_y - 2, tip_x + string_width(tip_slot.item_name) + 2, tip_y + string_height(tip_slot.item_name) + 2, false);
        draw_set_color(c_white);
        draw_text(tip_x, tip_y, tip_slot.item_name);
    }
}