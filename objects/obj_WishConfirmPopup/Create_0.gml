gui_w = display_get_gui_width();
gui_h = display_get_gui_height();
message = "Make a wish for 10 yuan?";

var _btn_y = gui_h / 2 - 120; 
var _yes_x = gui_w / 2 - 100;
var _no_x = gui_w / 2 + 100;

yes_button = instance_create_depth(_yes_x, _btn_y, -10001, obj_ButtonWishYes);
no_button = instance_create_depth(_no_x, _btn_y, -10001, obj_ButtonWishNo);

yes_button.owner_popup = id;
no_button.owner_popup = id;