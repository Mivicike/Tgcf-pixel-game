scale = 4;

//Painting items across inventory slots
rclick_painting      = false;
rclick_painted_slots = ds_list_create();
rclick_items_placed  = 0;
last_click_time      = -9999;
last_click_slot      = -1;

// Slot size in pixels (GUI space)
slot_w = 18 * scale;
slot_h = 18 * scale;

// Padding between slots
padding = 2 * scale;

// GUI dimensions
gui_w = display_get_gui_width();
gui_h = display_get_gui_height();

// Background sprite dimensions
bg_w = sprite_get_width(Spr_InventoryBackground) * scale;
bg_h = sprite_get_height(Spr_InventoryBackground) * scale;
bg_x = (gui_w - bg_w) / 2;
bg_y = (gui_h - bg_h) / 2;

// Grid origin (tweak offsets to align with your sprite's inner area)
grid_origin_x = bg_x + 12 * scale;
grid_origin_y = bg_y + 12 * scale;

// Hovered slot for tooltip / highlight
hovered_slot = -1;

//Drag-and-drop state
drag_slot     = -1;   // slot index we are dragging FROM (-1 = not dragging)
drag_item     = "";   // item name being dragged
drag_count    = 0;    // how many we are carrying
drag_x        = 0;   // current mouse GUI X
drag_y        = 0;   // current mouse GUI Y
