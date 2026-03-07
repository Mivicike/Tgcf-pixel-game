// Dialog box
var _dx = 0;
var _dy = gui_h * 0.7;
var _boxw = gui_w;
var _boxh = gui_h - _dy;

draw_sprite_stretched(Spr_DialogueBox, 0, _dx, _dy, _boxw, _boxh);

_dx += 38;
_dy += 25;

draw_set_font(Font1);

var _name = messages[current_message] .name;

//Draw name
draw_set_colour(global.char_colors[$ _name]);
draw_text(_dx, _dy, _name);
draw_set_colour(c_maroon);

//Draw message text
_dy += 25;
draw_text_ext(_dx, _dy, draw_message, -1, _boxw - _dx * 2);