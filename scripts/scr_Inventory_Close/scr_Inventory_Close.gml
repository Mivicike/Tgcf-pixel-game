function scr_Inventory_Close() {
	if (drag_slot != -1) {
		global.inventory[drag_slot] = drag_item;
		drag_slot = -1;
	}
	rclick_painting = false;
	ds_list_clear(rclick_painted_slots);
	global.inventory_just_closed = true;
	global.sanlang_gift_mode = false;
	global.kitchen_mode = false;
	global.sanlang_feed_mode = false;
	instance_destroy();
}