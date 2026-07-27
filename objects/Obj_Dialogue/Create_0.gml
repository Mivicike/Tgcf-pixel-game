messages = [];

current_message = 0;
current_char = 0;
draw_message = "";

char_speed = 0.5;
input_key = ord("Z");

gui_w = display_get_gui_width();
gui_h = display_get_gui_height();

sound_played_for = -1;