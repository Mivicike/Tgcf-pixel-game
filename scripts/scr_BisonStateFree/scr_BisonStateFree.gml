function scr_BisonStateFree()
{
    // Rules for Bison: Stands in one spot
    // Attacks by either charging or performing a static attack
    // Charge is triggered if the player is outside a certain range
    // Bison charges forward and then returns to its original position
    // Static attack is triggered if the player is within a certain range
    // Bison performs a static attack and then returns to its original position (It doesn't move for this attack)
    // Attacks share a cooldown timer, so Bison cannot attack again until the cooldown is over
    // Between attacks the player can attack the Bison and the Bison will not attack back until the cooldown is over
    with(obj_Bison)
    {
        sprite_index = Spr_Bison_Idle;

        var distance_to_player = point_distance(x, y, obj_XieLian.x, obj_XieLian.y);
        var can_attack = (attack_cooldown_timer <= 0);
        if (!can_attack)
        {
            var dt = delta_time / 1000000;
            attack_cooldown_timer -= dt;
            exit;
        }

        var y_delta = abs(y - obj_XieLian.y);
        var delta_target = 30
        if (obj_XieLian.y < y)
        {
            // Player is higher in the screen than the bison. The delta needs to be adjusted
            delta_target = 30
        }
        else
        {
            delta_target = 80;
        }

        if (y_delta > delta_target)
        {
            // Player is too far away vertically, do not attack
            exit;
        }

        if (distance_to_player >= attack_range)
        {
            // Player is within charge attack range, perform a charge attack
            state = BisonState.CHARGE_ATTACK;
        }
        else if (distance_to_player <= attack_range)
        {
            // Player is within static attack range, perform a static attack
            state = BisonState.ATTACK;
        }
    }
}