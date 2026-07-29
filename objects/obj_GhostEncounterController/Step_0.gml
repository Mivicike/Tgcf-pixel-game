if (ghosts_defeated_triggered) {
	exit;
}

if (instance_number(obj_GreenGhost) > 0) {
	saw_ghosts = true; 
}

if (saw_ghosts == true && instance_number(obj_GreenGhost) == 0) {
    
	if (!DIALOGUE_MANAGER.is_dialogue_active()) {
		ghosts_defeated_triggered = true;
		instance_create_depth(0, 0, -20000, obj_GhostEncounterCutscene);
	}
}