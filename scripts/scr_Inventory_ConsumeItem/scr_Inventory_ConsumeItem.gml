function scr_Inventory_ConsumeItem(_slot_index) {
	var _slot = global.inventory[_slot_index];
	if (_slot.item_name == "") exit;
	var _item_data = scr_GetItemDataByName(_slot.item_name);
	if (_item_data == undefined || _item_data.hp_change == undefined) exit;
	if (instance_exists(obj_XieLian)) {
		obj_XieLian.hp = clamp(obj_XieLian.hp + _item_data.hp_change, 0, obj_XieLian.liv);
	}
	audio_play_sound(snd_Klick, 1, false);
	_slot.count -= 1;
	if (_slot.count <= 0) {
		_slot.item_name = "";
		_slot.sprite = undefined;
		_slot.count = 0;
	}
}