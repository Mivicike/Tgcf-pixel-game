// Alarm to set character back to default settings
if (state == PLAYERSTATE.DASH) {
    vspeed = 0;
    hspeed = 0;
    sprite_index = save_sprite;
    state = PLAYERSTATE.FREE;
    dash = false;
	movement_locked = false;
	alarm_set(1,180)
}