if (ghosts_defeated_triggered) exit;

if (instance_number(obj_GreenGhost) == 0 && !DIALOGUE_MANAGER.is_dialogue_active()) {
    ghosts_defeated_triggered = true;
    if (instance_exists(obj_XieLian)) {
        obj_XieLian.movement_locked = true;
    }

    obj_CameraManager.fade_out(0.5, function(_d) {
        instance_create_depth(0, 0, -20000, obj_GhostEncounterCutscene);
    }, {});
}