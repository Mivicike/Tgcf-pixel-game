function scr_SanLang_ChoiceMenu_Confirm() {
    var _choice = options[selected_index];

    switch (_choice) {
        case "Follow me":
            obj_SanLang.mode = SANLANG_MODE.FOLLOW;
            instance_destroy();
            DIALOGUE_MANAGER.start_new_dialogue(global.dialogues.SanLang_AgreeToFollow);
            break;

        case "You don't have to follow me anymore":
		obj_SanLang.mode = SANLANG_MODE.AREA;
		obj_SanLang.area_anchor_x = obj_SanLang.x;
		obj_SanLang.area_anchor_y = obj_SanLang.y;
		obj_SanLang.area_room = room;
		instance_destroy();
		DIALOGUE_MANAGER.start_new_dialogue(global.dialogues.SanLang_AgreeToStay);
		break;

        case "Do you want to see this new thing I bought?":
            instance_destroy();
            scr_SanLang_OpenGiftInventory();
            break;

        case "What are you up to?":
            instance_destroy();
            var _pool = global.dialogues.SanLang_WhatAreYouUpTo;
            var _pick = _pool[irandom(array_length(_pool) - 1)];
            DIALOGUE_MANAGER.start_new_dialogue(_pick);
            break;
    }
}