scale = 4;

gui_w = display_get_gui_width();
gui_h = display_get_gui_height();

bg_w = sprite_get_width(Spr_ShopBackground) * scale;
bg_h = sprite_get_height(Spr_ShopBackground) * scale;
bg_x = (gui_w - bg_w) / 2;
bg_y = (gui_h - bg_h) / 2;

slot_w = 18 * scale;
slot_h = 18 * scale;
padding = 4 * scale;

// See: DialogueManager.gml complete_dialogue
/// @type {Array<Struct.ItemData>}
shop_items = [] // Shop stock
purchase_flag = undefined;
//num_items = array_length(shop_items); // Number of items

// Where the item list starts
grid_origin_x = bg_x + 16 * scale;
grid_origin_y = bg_y + 20 * scale;

hovered_slot = -1;

// Player yuan — initialise globally if not set
if (!variable_global_exists("yuan")) {
    global.yuan = 100;
}

// Feedback message
feedback_msg = "";
feedback_timer = 0;