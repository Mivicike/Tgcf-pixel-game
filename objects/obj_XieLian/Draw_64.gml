
var spacing = 22; // Spacing
var start_x = 14;
var start_y = 14;

//empty heart
for (var i = 0; i < liv; i++) {
    draw_sprite_ext(Spr_HeartEmpty, 0, start_x + i * spacing, start_y, 2, 2, 0, c_white, 1);
}

// Full heart
for (var i = 0; i < hp; i++) {
    draw_sprite_ext(Spr_HeartFull, 0, start_x + i * spacing, start_y, 2, 2, 0, c_white, 1);
}


// Draw debug info
if (debug_enabled) {
    var debug_text = "State: " + string(state) + "\n" +
                     "HSPD: " + string(hsp) + "\n" +
                     "VSPD: " + string(vsp) + "\n" +
                     "Position: (" + string(x) + ", " + string(y) + ")\n" +
                     "Dash: " + string(dash) + "\n" +
                     "Dash Cooldown: " + string(dash_cooldown) + "\n" +
                     "Attack Counter: " + string(attack_counter) + "\n" +
                     "Last Attack Time: " + string(last_attack_time) + "\n" +
                     "Attack Reset Time: " + string(attack_reset_time) + "\n" +
                     "Knockback X: " + string(kb_x) + "\n" +
                     "Knockback Y: " + string(kb_y);

    draw_text(10, 50, debug_text);
}