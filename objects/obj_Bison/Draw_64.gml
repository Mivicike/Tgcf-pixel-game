// Draw debug info about the enemy's state
if (debug) {
    draw_set_color(c_white);

    draw_set_halign(fa_left);
    draw_set_font(Font1_Smaller)
    draw_text(0, 10, $"State: {string(state)}");
    draw_text(0, 30, $"HP: {string(hp)}");
    draw_text(0, 50, $"Distance to Player: {string(point_distance(x, y, obj_XieLian.x, obj_XieLian.y))}");
    draw_text(0, 70, $"Y Delta to Player: {string(abs(y - obj_XieLian.y))}");
    draw_text(0, 90, $"Idle Timer: {string(idle_timer)}"    );
    draw_text(0, 110, $"Target Position: {string(starting_position[0] + charge_attack_distance)}");
    draw_text(0, 130, $"Attack Cooldown Timer: {string(attack_cooldown_timer)}");
}