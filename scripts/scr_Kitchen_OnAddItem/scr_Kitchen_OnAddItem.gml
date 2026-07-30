function scr_Kitchen_OnAddItem(_slot_index) {
	var _slot = global.inventory[_slot_index];
	if (_slot.item_name == "") exit;

	_slot.count -= 1;
	if (_slot.count <= 0) {
		_slot.item_name = "";
		_slot.sprite = undefined;
		_slot.count = 0;
	}

	global.kitchen_mode = false;
	instance_destroy(Obj_Inventory);
	global.inventory_just_closed = true;

	if (instance_exists(obj_KitchenUI)) {
		scr_Kitchen_AddPotLayer(obj_KitchenUI.pot_layers, "Failed");
		obj_KitchenUI.has_item = true;
	}
}