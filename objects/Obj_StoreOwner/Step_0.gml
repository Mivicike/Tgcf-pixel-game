event_inherited();

// When dialogue just finished, open the shop
if (open_shop_after_dialogue
    && !instance_exists(obj_Dialogue)
    && !instance_exists(Obj_Shop)
    && can_talk == false  
) {
   if (variable_instance_exists(id, "dialogue_was_active") && dialogue_was_active) {
    dialogue_was_active = false;
    instance_create_depth(0, 0, -9999, Obj_Shop);
    audio_play_sound(snd_MenuOpen, 1, false);
	}
}

// Track when dialogue becomes active
if (instance_exists(obj_Dialogue)) {
    dialogue_was_active = true;
}
