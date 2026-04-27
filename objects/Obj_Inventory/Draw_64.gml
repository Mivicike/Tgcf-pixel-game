// Obj_Inventory Draw GUI

// Draw background
draw_sprite_ext(Spr_InventoryBackground, 0, bg_x, bg_y, scale, scale, 0, c_white, 1);

// Draw slots and items
for (var row = 0; row < INVENTORY_ROWS; row++) {
    for (var col = 0; col < INVENTORY_COLS; col++) {
        var i = row * INVENTORY_COLS + col;
        var sx = grid_origin_x + col * (slot_w + padding);
        var sy = grid_origin_y + row * (slot_h + padding);

        // Draw slot box — highlight hovered
        var slot_col = (i == hovered_slot) ? make_color_rgb(255, 220, 100) : c_white;
        draw_sprite_ext(Spr_InventoryBox, 0, sx, sy, scale, scale, 0, slot_col, 1);

        // Draw item sprite if slot is filled
        var item = global.inventory[i];
        if (item != noone) {
            var item_spr = asset_get_index(item);
            if (item_spr != -1) {
                // Center item inside slot
                var item_cx = sx + slot_w / 2;
                var item_cy = sy + slot_h / 2;
                // Draw at scale, centered
                var item_scale = (scale * 0.75); // slightly smaller than slot
                draw_sprite_ext(item_spr, 0,
                    item_cx - sprite_get_xoffset(item_spr) * item_scale,
                    item_cy - sprite_get_yoffset(item_spr) * item_scale,
                    item_scale, item_scale, 0, c_white, 1);
            }
        }
    }
}

// Title
draw_set_font(Font1);
draw_set_halign(fa_center);
draw_set_color(c_white);
draw_text(bg_x + bg_w / 2, bg_y + 4 * scale, "INVENTORY");
draw_set_halign(fa_left);