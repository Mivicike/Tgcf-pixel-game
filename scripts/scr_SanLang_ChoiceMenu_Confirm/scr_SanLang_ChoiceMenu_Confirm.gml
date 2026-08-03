function scr_SanLang_ChoiceMenu_Confirm() {
	
    var _choice = options[selected_index];

    switch (_choice) {
        case "Follow me":
	obj_SanLang.mode = SANLANG_MODE.FOLLOW;
	scr_SaveData_SetFlag("sanlang_mode", "FOLLOW");
	instance_destroy();
	DIALOGUE_MANAGER.start_new_dialogue(global.dialogues.SanLang_AgreeToFollow);
	break;
	case "Cancel":
	instance_destroy();
	break;
	case "Hold my hand":
	instance_destroy();
	scr_SanLang_StartHoldingHands();
	break;
		case "You don't have to follow me anymore":
	obj_SanLang.mode = SANLANG_MODE.AREA;
	obj_SanLang.area_anchor_x = obj_SanLang.x;
	obj_SanLang.area_anchor_y = obj_SanLang.y;
	obj_SanLang.area_room = room;
	scr_SaveData_SetFlag("sanlang_mode", "AREA");
	scr_SaveData_SetFlag("sanlang_area_room", room_get_name(room));
	scr_SaveData_SetFlag("sanlang_x", obj_SanLang.x);
	scr_SaveData_SetFlag("sanlang_y", obj_SanLang.y);
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
			case "Feed San Lang":
		instance_destroy();
		scr_SanLang_OpenFeedInventory();
		break;
    }
}