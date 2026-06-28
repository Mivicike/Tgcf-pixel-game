function scr_BisonStateReturn() {
    with(obj_Bison) {
        // ALlow for a short pause before returning to the starting position
        if (return_delay_timer > 0) {
            sprite_index = Spr_Bison_Idle;
            var dt = delta_time / 1000000; // Convert microseconds to seconds
            return_delay_timer -= dt;
            exit; // Wait until the delay timer reaches 0 before moving back
        }

        sprite_index = Spr_Bison_Walking;

        // Move back to starting position
        var target_x = starting_position[0];
        var target_y = starting_position[1];

        // Move towards the target position
        var move_speed = 2; // Adjust this value for speed
        var dx = target_x - x;
        var dy = target_y - y;
        var distance = point_distance(x, y, target_x, target_y);

        if (distance > move_speed) {
            x += (dx / distance) * move_speed;
            y += (dy / distance) * move_speed;
        } else {
            // Reached the target position
            x = target_x;
            y = target_y;
            state = BisonState.IDLE; // Change state to Idle or any other appropriate state
        }
    }
}