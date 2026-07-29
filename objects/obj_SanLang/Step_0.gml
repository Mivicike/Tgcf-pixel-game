if (!sanlang_present) {
	can_talk = false;
	exit;
}

var _in_range = instance_exists(obj_XieLian) && distance_to_object(obj_XieLian) < 8;
can_talk = false;

if (mode != SANLANG_MODE.SCRIPTED && _in_range && DIALOGUE_MANAGER.can_dialogue_start() && !instance_exists(obj_SanLangChoiceMenu) && !instance_exists(Obj_Inventory) && !instance_exists(obj_GhostEncounterCutscene)) {
	can_talk = true;
	if (keyboard_check_pressed(input_key) && !global.z_interaction_used) {
		global.z_interaction_used = true;
		scr_SanLang_Interact();
	}
}

scr_SanLang_UpdateCombat();

if (DIALOGUE_MANAGER.is_dialogue_active() || movement_locked || instance_exists(obj_SanLangChoiceMenu)) {
	state = SANLANG_STATE.IDLE;
	is_attacking = false;
}
else if (mode == SANLANG_MODE.SCRIPTED) {
	is_attacking = false;
	scr_SanLang_StateScripted();
}
else if (target_enemy != noone) {
	scr_SanLang_StateCombat();
}
else {
	is_attacking = false;
	switch (mode) {
		case SANLANG_MODE.FOLLOW:
			scr_SanLang_StateFollow();
			break;
		case SANLANG_MODE.AREA:
			scr_SanLang_StateArea();
			break;
	}
}

scr_SanLang_UpdateSprite();