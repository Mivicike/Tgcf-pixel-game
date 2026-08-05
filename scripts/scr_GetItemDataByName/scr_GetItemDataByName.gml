function scr_GetItemDataByName(_item_name) {
	var _keys = variable_struct_get_names(global.items);
	for (var i = 0; i < array_length(_keys); i++) {
		var _item = variable_struct_get(global.items, _keys[i]);
		if (_item.name == _item_name) {
			return _item;
		}
	}
	return undefined;
}