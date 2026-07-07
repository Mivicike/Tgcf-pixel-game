var dt = delta_time / 1000000;
timer += dt;

y -= rise_speed * dt;

if (timer >= life_time) {
	instance_destroy();
}