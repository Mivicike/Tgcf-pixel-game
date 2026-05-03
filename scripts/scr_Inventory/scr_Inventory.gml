#macro INVENTORY_ROWS 3
#macro INVENTORY_COLS 6
#macro INVENTORY_SIZE 18   // ROWS * COLS
#macro STACK_MAX      99   // Maximum items per stack

/// @desc A single inventory slot: holds an item name + count. Empty = name is "".
function InventorySlot() constructor {
    item_name = "";
    count     = 0;
}

/// Initialise the global inventory array (call once from obj_init).
function inventory_init() {
    global.inventory = array_create(INVENTORY_SIZE);
    for (var i = 0; i < INVENTORY_SIZE; i++) {
        global.inventory[i] = new InventorySlot();
    }
}

/// Returns true if the slot at index i is empty.
function inventory_slot_empty(i) {
    return (global.inventory[i].item_name == "");
}

/// Add one (or _count) of item_name to the inventory.
/// Tries to stack onto existing stacks first, then fills empty slots.
/// Returns the slot index used, or -1 if no room.
function inventory_add_item(item_name, _count = 1) {
    // 1. Try to top-up an existing stack of the same item.
    for (var i = 0; i < INVENTORY_SIZE; i++) {
        var slot = global.inventory[i];
        if (slot.item_name == item_name && slot.count < STACK_MAX) {
            var space = STACK_MAX - slot.count;
            var add   = min(_count, space);
            slot.count += add;
            _count     -= add;
            if (_count <= 0) return i;
        }
    }

    // 2. Spill remainder into empty slots.
    for (var i = 0; i < INVENTORY_SIZE; i++) {
        if (inventory_slot_empty(i)) {
            var slot      = global.inventory[i];
            slot.item_name = item_name;
            slot.count     = min(_count, STACK_MAX);
            _count        -= slot.count;
            if (_count <= 0) return i;
        }
    }

    // 3. Could not fit everything.
    return -1;
}

/// Remove _count of item_name from inventory.
/// Returns true if successful, false if not enough items.
function inventory_remove_item(item_name, _count = 1) {
    // First check we have enough
    var total = 0;
    for (var i = 0; i < INVENTORY_SIZE; i++) {
        if (global.inventory[i].item_name == item_name)
            total += global.inventory[i].count;
    }
    if (total < _count) return false;

    // Remove from the end to keep stacks tidy
    for (var i = INVENTORY_SIZE - 1; i >= 0; i--) {
        var slot = global.inventory[i];
        if (slot.item_name == item_name) {
            var take      = min(slot.count, _count);
            slot.count   -= take;
            _count       -= take;
            if (slot.count <= 0) {
                slot.item_name = "";
                slot.count     = 0;
            }
            if (_count <= 0) return true;
        }
    }
    return true;
}

/// Swap two inventory slots (used by drag-and-drop).
function inventory_swap_slots(a, b) {
    var tmp_name  = global.inventory[a].item_name;
    var tmp_count = global.inventory[a].count;
    global.inventory[a].item_name = global.inventory[b].item_name;
    global.inventory[a].count     = global.inventory[b].count;
    global.inventory[b].item_name = tmp_name;
    global.inventory[b].count     = tmp_count;
}

/// Merge slot b onto slot a (same item type). Leftover stays in b.
function inventory_merge_slots(a, b) {
    if (global.inventory[a].item_name != global.inventory[b].item_name) return;
    var space = STACK_MAX - global.inventory[a].count;
    var move  = min(space, global.inventory[b].count);
    global.inventory[a].count += move;
    global.inventory[b].count -= move;
    if (global.inventory[b].count <= 0) {
        global.inventory[b].item_name = "";
        global.inventory[b].count     = 0;
    }
}

/// Split a stack in half. The upper half stays in slot a; the lower half goes to
/// the first available empty slot. Returns the target slot index, or -1 if no room.
function inventory_split_stack(a) {
    var slot = global.inventory[a];
    if (slot.count < 2) return -1;
    var half = floor(slot.count / 2);
    for (var i = 0; i < INVENTORY_SIZE; i++) {
        if (inventory_slot_empty(i) && i != a) {
            global.inventory[i].item_name = slot.item_name;
            global.inventory[i].count     = half;
            slot.count                   -= half;
            return i;
        }
    }
    return -1;
}

/// Returns true if the inventory is open.
function inventory_is_open() {
    return instance_exists(Obj_Inventory);
}
