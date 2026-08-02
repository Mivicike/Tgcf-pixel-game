if (!show_prompt) exit;
var pos = scr_ConvertWorldToGUI(x, y - 20);
draw_set_font(Font1_Smaller);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_white);
draw_text(pos[0], pos[1], "Interact (Z)");
draw_set_halign(fa_left);
draw_set_valign(fa_top);