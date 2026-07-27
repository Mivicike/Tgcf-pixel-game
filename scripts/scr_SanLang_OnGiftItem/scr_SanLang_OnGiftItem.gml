function scr_SanLang_OnGiftItem(_slot_index) {
    var _slot = global.inventory[_slot_index];
    if (_slot.item_name == "") exit;

    var _item_dialogue = variable_struct_exists(global.dialogues.SanLang_ItemGifts, _slot.item_name)
        ? global.dialogues.SanLang_ItemGifts[$ _slot.item_name]
        : global.dialogues.SanLang_ItemGifts_Default;

    _slot.count -= 1;
    if (_slot.count <= 0) {
        _slot.item_name = "";
        _slot.sprite = undefined;
        _slot.count = 0;
    }

    global.sanlang_gift_mode = false;
    instance_destroy(Obj_Inventory);
    global.inventory_just_closed = true;

    DIALOGUE_MANAGER.start_new_dialogue(_item_dialogue);
}