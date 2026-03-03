// --- Dialog box ---
var _dx = 0;
var _dy = gui_h * 0.7;
var _boxw = gui_w;
var _boxh = gui_h - _dy;

draw_sprite_stretched(Spr_DialogueBox, 0, _dx, _dy, _boxw, _boxh);

_dx += 38;
_dy += 25;

draw_set_font(Font1);

var _name = messages[current_message].name;

//Get portrait
var _portrait = noone;

if (messages[current_message].expression != "")
{
	_portrait = asset_get_index(messages[current_message].expression);
}

//Draw portrait
if (_portrait != noone)
{
	var _px = 10;
	var _py = _dy - 12;

	draw_sprite_ext(_portrait, 0, _px, _py, 2, 2, 0, c_white, 1);
}

//Draw name
draw_set_colour(global.char_colors[$ _name]);
draw_text(_dx, _dy, _name);
draw_set_colour(c_maroon);

//Draw message text
_dy += 25;
draw_text_ext(_dx, _dy, draw_message, -1, _boxw - _dx * 2);