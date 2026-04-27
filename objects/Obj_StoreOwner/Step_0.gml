event_inherited(); // runs Obj_Npc_Parent logic

// When dialogue just finished, open the shop
if (open_shop_after_dialogue
    && !instance_exists(obj_Dialogue)
    && !instance_exists(Obj_Shop)
    && can_talk == false  // player walked away OR dialogue just ended
) {
    // Only open shop if dialogue was recently active
    // We use a flag set during dialogue
    if (variable_instance_exists(id, "dialogue_was_active") && dialogue_was_active) {
        dialogue_was_active = false;
        instance_create_depth(0, 0, -9999, Obj_Shop);
    }
}

// Track when dialogue becomes active
if (instance_exists(obj_Dialogue)) {
    dialogue_was_active = true;
}