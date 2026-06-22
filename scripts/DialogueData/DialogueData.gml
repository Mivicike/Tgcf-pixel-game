/// @description A struct that holds dialogue data
/// @param {String} _name The name of the dialogue
/// @param {Array<Struct.DialogueLine>} _messages An array of dialogue messages
/// @param {Struct.ShopData} _shop_data Optional shop data to open after dialogue
function DialogueData(_name, _messages, _shop_data = undefined) constructor {
	name = _name;
	messages = _messages;
	shop = _shop_data;
	open_shop_after_dialogue = _shop_data != undefined;
}

/// @description A struct that holds a single dialogue message
/// @param {String} _name The name of the character speaking
/// @param {String} _msg The message text
/// @param {Asset.GMSprite} _expression The sprite representing the character's expression
function DialogueLine(_name, _msg, _expression = undefined) constructor {
	name = _name;
	msg = _msg;
	expression = _expression;
}

/// @description A struct that holds shop data for opening a shop after dialogue
/// @param {Array<Struct.ItemData>} _items An array of item data for the
function ShopData(_items) constructor {
	shop_items = _items; // Array of structs with item data (e.g., {name, price, sprite})
}

/// @description A struct that holds item data for the shop
/// @param {String} _name The name of the item
/// @param {Real} _price The price of the item
/// @param {Asset.GMSprite} _sprite The sprite representing the item
function ItemData(_name, _price, _sprite) constructor {
	name = _name;
	price = _price;
	sprite = _sprite;
}