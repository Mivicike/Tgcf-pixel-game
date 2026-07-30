if (instance_exists(Obj_Inventory)) exit;

var col = hover ? make_color_rgb(245, 232, 193) : c_white;
draw_sprite_ext(spr_KitchenButton, 0, x, y, img_scale_x, img_scale_y, 0, col, 1);

draw_set_font(Font1);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_white);
draw_text(x, y, "Done");
draw_set_halign(fa_left);
draw_set_valign(fa_top);