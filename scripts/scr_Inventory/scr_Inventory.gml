// scr_Inventory but nothing here yet ;
// scr_Inventory.gml

#macro INVENTORY_COLS 5
#macro INVENTORY_ROWS 4
#macro INVENTORY_SIZE 20  // COLS * ROWS

function inventory_init() {
    global.inventory = array_create(INVENTORY_SIZE, noone);
}

// Returns the slot index where item was added, or -1 if full
function inventory_add_item(item_name) {
    for (var i = 0; i < INVENTORY_SIZE; i++) {
        if (global.inventory[i] == noone) {
            global.inventory[i] = item_name;
            return i;
        }
    }
    return -1; // Inventory full
}

function inventory_remove_item(slot_index) {
    if (slot_index >= 0 && slot_index < INVENTORY_SIZE) {
        global.inventory[slot_index] = noone;
    }
}

function inventory_is_open() {
    return instance_exists(Obj_Inventory);
}