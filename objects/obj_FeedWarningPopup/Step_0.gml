timer += 1 / room_speed;

if (timer >= life_time) {
	instance_destroy();
}