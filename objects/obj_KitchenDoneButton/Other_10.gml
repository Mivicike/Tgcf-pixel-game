inventory_add_item(global.items.strange_food, 1);

if (variable_global_exists("auto_save") && global.auto_save) {
	scr_SaveData_SavePlayerAndInventory();
}

instance_destroy(owner_popup);