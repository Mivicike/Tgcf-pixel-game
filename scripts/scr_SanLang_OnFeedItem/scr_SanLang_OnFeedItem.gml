function scr_SanLang_OnFeedItem(_slot_index) {
	var _slot = global.inventory[_slot_index];
	if (_slot.item_name == "") exit;

	if (_slot.item_name != "Strange Food") {
		var _popup = instance_create_depth(0, 0, -10002, obj_FeedWarningPopup);
		_popup.text = "You need to cook something.";
		_popup.color = c_white;
		exit;
	}

	_slot.count -= 1;
	if (_slot.count <= 0) {
		_slot.item_name = "";
		_slot.sprite = undefined;
		_slot.count = 0;
	}

	global.sanlang_feed_mode = false;
	instance_destroy(Obj_Inventory);
	global.inventory_just_closed = true;

	scr_SaveData_SetFlag("sanlang_fed", true);
	scr_SaveData_SetFlag("sanlang_quest_active", false);
	scr_SaveData_SetFlag("candles_unlocked", true);

	DIALOGUE_MANAGER.start_new_dialogue(global.dialogues.sanlang_fed_dialogue);
}