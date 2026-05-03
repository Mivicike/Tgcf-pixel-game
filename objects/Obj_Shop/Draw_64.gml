draw_sprite_ext(Spr_ShopBackground, 0, bg_x, bg_y, scale, scale, 0, c_white, 1);

// kronor display
draw_set_font(Font1)
draw_set_halign(fa_left);
draw_set_color(make_color_rgb(245, 232, 193));
draw_text(bg_x + 8 * scale, bg_y + 10 * scale, "kronor: " + string(global.kronor));

// font for all other items
draw_set_font(Font1_Smaller);
// Draw items
for (var i = 0; i < num_items; i++) {
    var item = shop_items[i];
    var sx = grid_origin_x + i * (slot_w + padding);
    var sy = grid_origin_y;

    var slot_col = (i == hovered_slot) ? make_color_rgb(245, 232, 193) : c_white;
    draw_sprite_ext(Spr_InventoryBox, 0, sx, sy, scale, scale, 0, slot_col, 1);

    // Item sprite
    var item_spr = asset_get_index(item.name);
    if (item_spr != -1) {
        var item_scale = scale * 1;
        var item_cx = sx + slot_w / 2 -35;
        var item_cy = sy + slot_h / 2 -37.5;
        draw_sprite_ext(item_spr, 0,
            item_cx - sprite_get_xoffset(item_spr) * item_scale,
            item_cy - sprite_get_yoffset(item_spr) * item_scale,
            item_scale, item_scale, 0, c_white, 1);
    }

    // Label + price below slot
    make_colour_rgb(245, 232, 193)
    draw_set_halign(fa_center);
    draw_text(sx + slot_w / 2, sy + slot_h -2 * scale, item.label);
    draw_set_color(make_color_rgb(245, 232, 193));
    draw_text(sx + slot_w / 2, sy + slot_h +1 * scale, string(item.price) + "kr");
}

// message
draw_set_font(Font1)
if (feedback_timer > 0) {
    draw_set_color(make_color_rgb(75, 138, 56));
    draw_set_halign(fa_center);
    draw_text(bg_x + bg_w / 2, bg_y + bg_h - 16 * scale, feedback_msg);
}

draw_set_halign(fa_left);
draw_set_color(c_white);