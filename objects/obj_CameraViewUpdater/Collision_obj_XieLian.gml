if (!enabled)
    return;

if (GAME_CAMERA.last_trigger_zone != undefined && GAME_CAMERA.last_trigger_zone == self) {
    // Already triggered this zone, do nothing
    return;
}

if (reset_to_default) {
    GAME_CAMERA.reset_all();
}
else {
    GAME_CAMERA.last_trigger_zone = self;
	GAME_CAMERA.zoom_to(target_zoom_level);
    GAME_CAMERA.center_with_offset_then_apply(target_offset_x, target_offset_y, lock_x, lock_y);
}