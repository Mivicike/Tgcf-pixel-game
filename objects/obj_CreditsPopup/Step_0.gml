if (keyboard_check(vk_down) || mouse_wheel_down()) {
    scroll_y = clamp(scroll_y + scroll_speed, 0, max_scroll);
}
if (keyboard_check(vk_up) || mouse_wheel_up()) {
    scroll_y = clamp(scroll_y - scroll_speed, 0, max_scroll);
}