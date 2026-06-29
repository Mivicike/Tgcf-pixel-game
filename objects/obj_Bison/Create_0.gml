event_inherited();
enum BisonState {
    IDLE,
    ATTACK,
    CHARGE_ATTACK,
    RETURN,
    DEAD
}


state = BisonState.IDLE;
debug = false;
move_speed = 3;

starting_position = [x, y];
attack_range = 90;
charge_attack_distance = 400; // The distance the bison will charge forward when performing a charge attack
attack_cooldown = 1; // The cooldown time between attacks in seconds
attack_cooldown_timer = 0; // Timer to track the cooldown between attacks
image_speed = 1;
return_delay = 1;
return_delay_timer = 0;

charge_move_speed = 6; // The speed at which the bison moves during a charge attack
charge_complete = false;
charge_started = false;