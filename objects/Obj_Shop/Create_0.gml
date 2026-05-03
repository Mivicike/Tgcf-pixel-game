// Obj_Shop but nothing here yet ;
// Obj_Shop Create

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

// Shop stock — array of structs: { name, price, sprite }
shop_items = [
    { name: "Spr_ItemApple",  label: "Apple",   price: 5  },
    { name: "Spr_ItemBaoBun", label: "Bao Bun", price: 8  },
	{ name: "Spr_ItemAppleJuice", label: "Apple Juice", price: 10  },
	{ name: "Spr_ItemAppleMash", label: "Apple Mash", price: 6  },
];

// Number of items
num_items = array_length(shop_items);

// Where the item list starts
grid_origin_x = bg_x + 16 * scale;
grid_origin_y = bg_y + 20 * scale;

hovered_slot = -1;

// Player kronor — initialise globally if not set
if (!variable_global_exists("Kronor")) {
    global.kronor = 100;
}

// Feedback message
feedback_msg = "";
feedback_timer = 0;