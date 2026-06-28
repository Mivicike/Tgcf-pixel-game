var dt = delta_time / 1000000; // Convert microseconds to seconds
timer += dt;
if (timer >= poll_rate) {
    timer = 0; // Reset the timer
    if (place_meeting(x, y, obj_XieLian)) {
        player_inside = true;
    } else {
        player_inside = false;
    }
}

//show_debug_message($"Player Inside: {string(player_inside)} | Timer: {string(timer)} | Poll Rate: {string(poll_rate)}");