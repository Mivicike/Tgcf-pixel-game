// Obj_Shop but nothing here yet ;
// Obj_Shop Draw GUI

draw_sprite_ext(Spr_ShopBackground, 0, bg_x, bg_y, scale, scale, 0, c_white, 1);

draw_set_font(Font1);

// Title
draw_set_halign(fa_center);
draw_set_color(c_white);
draw_text(bg_x + bg_w / 2, bg_y + 4 * scale, "SHOP");

// Gold display
draw_set_halign(fa_left);
draw_set_color(make_color_rgb(255, 215, 0));
draw_text(bg_x + 8 * scale, bg_y + 10 * scale, "Gold: " + string(global.gold));

// Draw items
for (var i = 0; i < num_items; i++) {
    var item = shop_items[i];
    var sx = grid_origin_x + i * (slot_w + padding);
    var sy = grid_origin_y;

    var slot_col = (i == hovered_slot) ? make_color_rgb(255, 220, 100) : c_white;
    draw_sprite_ext(Spr_InventoryBox, 0, sx, sy, scale, scale, 0, slot_col, 1);

    // Item sprite
    var item_spr = asset_get_index(item.name);
    if (item_spr != -1) {
        var item_scale = scale * 0.75;
        var item_cx = sx + slot_w / 2;
        var item_cy = sy + slot_h / 2;
        draw_sprite_ext(item_spr, 0,
            item_cx - sprite_get_xoffset(item_spr) * item_scale,
            item_cy - sprite_get_yoffset(item_spr) * item_scale,
            item_scale, item_scale, 0, c_white, 1);
    }

    // Label + price below slot
    draw_set_color(c_white);
    draw_set_halign(fa_center);
    draw_text(sx + slot_w / 2, sy + slot_h + 2 * scale, item.label);
    draw_set_color(make_color_rgb(255, 215, 0));
    draw_text(sx + slot_w / 2, sy + slot_h + 8 * scale, string(item.price) + "g");
}

// Feedback message
if (feedback_timer > 0) {
    draw_set_color(make_color_rgb(100, 255, 100));
    draw_set_halign(fa_center);
    draw_text(bg_x + bg_w / 2, bg_y + bg_h - 12 * scale, feedback_msg);
}

draw_set_halign(fa_left);
draw_set_color(c_white);