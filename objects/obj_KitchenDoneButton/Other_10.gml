inventory_add_item({ name: "Strange Food", price: 0, sprite: "spr_StrangeFood" }, 1);

if (variable_global_exists("auto_save") && global.auto_save) {
	scr_SaveData_SavePlayerAndInventory();
}

instance_destroy(owner_popup);