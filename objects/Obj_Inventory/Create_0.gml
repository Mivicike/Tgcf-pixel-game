scale = 4;

// Slot size in pixels
slot_w = 18 * scale; 
slot_h = 18 * scale;

// Padding between slots
padding = 2 * scale;

// GUI dimensions (viewport is 420x280)
gui_w = display_get_gui_width();
gui_h = display_get_gui_height();

// Background origin (centered)
bg_w = sprite_get_width(Spr_InventoryBackground) * scale;
bg_h = sprite_get_height(Spr_InventoryBackground) * scale;
bg_x = (gui_w - bg_w) / 2;
bg_y = (gui_h - bg_h) / 2;

// Where the grid of slots starts inside the background
// Tweak these offsets to align with your sprite's inner area
grid_origin_x = bg_x + 12 * scale;
grid_origin_y = bg_y + 12 * scale;

// Hovered slot for tooltip / selection
hovered_slot = -1;