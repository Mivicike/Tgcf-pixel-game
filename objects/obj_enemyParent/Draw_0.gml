draw_self();

if (debug_enabled) {
    // Draw the bounding box
    draw_set_color(c_red);
    draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, true);
}