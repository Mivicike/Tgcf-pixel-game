#macro INVENTORY_ROWS 3
#macro INVENTORY_COLS 6
#macro INVENTORY_SIZE 18   // ROWS x COLS
#macro STACK_MAX      99   // Maximum items per stack

function InventorySlot() constructor {
    item_name = "";
    sprite = undefined;
    count     = 0;
}

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

function inventory_contains_item(_item) {
    for (var i = 0; i < INVENTORY_SIZE; i++) {
        if (global.inventory[i].item_name == _item.name)
            return true;
    }
    return false;
}

function inventory_clear_slot(_index) {
    global.inventory[_index].item_name = "";
    global.inventory[_index].count     = 0;
    global.inventory[_index].sprite    = undefined;
}

function inventory_add_item(_item, _count = 1) {
    // 1. Try to top-up an existing stack of the same item.
    for (var i = 0; i < INVENTORY_SIZE; i++) {
        var slot = global.inventory[i];
        if (slot.item_name == _item.name && slot.count < STACK_MAX) {
            var space = STACK_MAX - slot.count;
            var add   = min(_count, space);
            slot.count += add;
            _count     -= add;
            if (_count <= 0)
            return i;
        }
    }

    // 2. Spill remainder into empty slots.
    for (var i = 0; i < INVENTORY_SIZE; i++) {
        if (inventory_slot_empty(i)) {
            var slot      = global.inventory[i];
            slot.item_name = _item.name;
            slot.sprite    = _item.sprite;
            slot.count     = min(_count, STACK_MAX);
            _count        -= slot.count;
            if (_count <= 0) return i;
        }
    }

    return -1;
}

function inventory_remove_item(_item, _count = 1) {
    // First check we have enough
    var total = 0;
    for (var i = 0; i < INVENTORY_SIZE; i++) {
        if (global.inventory[i].item_name == _item.name)
            total += global.inventory[i].count;
    }
    if (total < _count) return false;

    // Remove from the end to keep stacks good
    for (var i = INVENTORY_SIZE - 1; i >= 0; i--) {
        var slot = global.inventory[i];
        if (slot.item_name == _item.name) {
            var take      = min(slot.count, _count);
            slot.count   -= take;
            _count       -= take;
            if (slot.count <= 0) {
                slot.item_name = "";
                slot.sprite    = undefined;
                slot.count     = 0;
            }
            if (_count <= 0) return true;
        }
    }
    return true;
}

function inventory_swap_slots(a, b) {
    var tmp_name  = global.inventory[a].item_name;
    var tmp_count = global.inventory[a].count;
    var tmp_sprite = global.inventory[a].sprite;
    global.inventory[a].item_name = global.inventory[b].item_name;
    global.inventory[a].count     = global.inventory[b].count;
    global.inventory[a].sprite    = global.inventory[b].sprite;
    global.inventory[b].item_name = tmp_name;
    global.inventory[b].count     = tmp_count;
    global.inventory[b].sprite    = tmp_sprite;
}

function inventory_merge_slots(a, b) {
    if (global.inventory[a].item_name != global.inventory[b].item_name) return;
    var space = STACK_MAX - global.inventory[a].count;
    var move  = min(space, global.inventory[b].count);
    global.inventory[a].count += move;
    global.inventory[b].count -= move;
    if (global.inventory[b].count <= 0) {
        global.inventory[b].item_name = "";
        global.inventory[b].count     = 0;
        global.inventory[b].sprite    = undefined;
    }
}

function inventory_split_stack(a) {
    var slot = global.inventory[a];
    if (slot.count < 2) return -1;
    var half = floor(slot.count / 2);
    for (var i = 0; i < INVENTORY_SIZE; i++) {
        if (inventory_slot_empty(i) && i != a) {
            global.inventory[i].item_name = slot.item_name;
            global.inventory[i].count     = half;
            global.inventory[i].sprite    = slot.sprite;
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
