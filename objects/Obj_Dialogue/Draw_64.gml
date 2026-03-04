//for now i use a box but i want to change it to a sprite later
var _dx = 0;
var _dy = gui_h * 0.7;
var _boxw = gui_w;
var _boxh = gui_h - _dy;

// Draw dialogue box background
draw_sprite_stretched(Spr_DialogueBox, 0, _dx, _dy, _boxw, _boxh);

// Get current message data
var _msg_data = messages[current_message];
var _name = _msg_data.name;
var _expression = _msg_data[$ "expression"]; // Optional expression field (using $ for safe access)

_dx += 16;
_dy += 16;

// Draw character portrait/expression (if provided)
if (!is_undefined(_expression) && _expression != "") {
    var _sprite = asset_get_index(_expression);
    if (_sprite != -1 && sprite_exists(_sprite)) {
        // Draw expression in top-left corner above the text
        var _expr_x = _dx;
        var _expr_y = _dy - 80; // Offset above the text area
        draw_sprite(_sprite, 0, _expr_x, _expr_y);
    }
}

draw_set_font(Font1);
draw_set_colour(global.char_colors[$ _name]);
draw_text(_dx, _dy, _name);
draw_set_colour(c_white);

_dy += 40;
draw_text_ext(_dx, _dy, draw_message, -1, _boxw - _dx * 2);
