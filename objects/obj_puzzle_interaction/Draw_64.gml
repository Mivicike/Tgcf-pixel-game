// Don't draw the message if the player hasn't interacted/in range of the object
if (!interacted_with) {
    return;
}

var pos = scr_ConvertWorldToGUI(x, y);
if (inventory_contains_item(required_item))
{
	draw_set_colour(c_white);
	draw_set_font(Font1_Smaller);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_text(pos[0] + message_offset_x, pos[1] + message_offset_y, has_item_message);
}
else
{
	draw_set_colour(c_white);
	draw_set_font(Font1_Smaller);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_text(pos[0] + message_offset_x, pos[1] + message_offset_y, missing_item_message);
}