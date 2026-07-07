gui_w = display_get_gui_width();
gui_h = display_get_gui_height();

message = "Are you sure you want to restart\nfrom the beginning?";

var _yes_x = gui_w / 2 -310;
var _no_x  = gui_w / 2 -140 ;
var _btn_y = gui_h / 2 -120;

yes_button = instance_create_depth(_yes_x, _btn_y, -10001, obj_ButtonConfirmYes);
no_button  = instance_create_depth(_no_x, _btn_y, -10001, obj_ButtonConfirmNo);

yes_button.owner_popup = id;
no_button.owner_popup  = id;