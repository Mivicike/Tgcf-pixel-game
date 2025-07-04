
var screen_x = camera_get_view_x(view_camera[0]);
var screen_y = camera_get_view_y(view_camera[0]);

var bubble_width = 186;
var bubble_height = 40;

var draw_x = npc_x - screen_x - bubble_width/2;
var draw_y = npc_y - screen_y - 60;

draw_sprite(Spr_SpeechBubble, 0, draw_x + bubble_width/2, draw_y + bubble_height/2);
draw_set_color(c_black);
draw_text(draw_x + 10, draw_y + 10, dialogue[dialogue_index]);
