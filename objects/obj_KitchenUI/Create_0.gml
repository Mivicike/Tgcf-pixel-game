gui_w = display_get_gui_width();
gui_h = display_get_gui_height();

scale = 2;

show_intro_message = true;
intro_message = "In order to complete a dish you need to put in \n at least 1 item from your inventory.";

bg_w = 500 * scale;
bg_h = 280 * scale;
bg_x = (gui_w - bg_w) / 2;
bg_y = (gui_h - bg_h) / 2;

bg_anim_speed = 0.15;
bg_anim_index = 0;

pot_anim_speed = 0.15;
pot_anim_index = 0;

open_inventory_button = instance_create_depth(bg_x + 385 * scale + 10, bg_y + 285 * scale - 100, -9001, obj_KitchenOpenInventoryButton);
open_inventory_button.owner_popup = id;

exit_button = instance_create_depth(bg_x + 440 * scale + 20, bg_y + 20 * scale + 10, -9001, obj_KitchenExitButton);
exit_button.owner_popup = id;

enum KITCHEN_SPICE {
	CHILI,
	PAKCHOI,
	RED,
	YELLOW,
	GREEN,
	SALT
}
spices = [
	{ type: KITCHEN_SPICE.CHILI,   sprite: spr_KitchenSpice_Chili,   x: 102,  y: 87},
	{ type: KITCHEN_SPICE.PAKCHOI, sprite: spr_KitchenSpice_PakChoi, x: 145, y: 35},
	{ type: KITCHEN_SPICE.RED,     sprite: spr_KitchenSpice_Red,     x: 380, y: 49},
	{ type: KITCHEN_SPICE.YELLOW,  sprite: spr_KitchenSpice_Yellow,  x: 397, y: 93},
	{ type: KITCHEN_SPICE.GREEN,   sprite: spr_KitchenSpice_Green,   x: 339, y: 29},
	{ type: KITCHEN_SPICE.SALT,   sprite: spr_KitchenSalt,   x: 98, y: 206}
];

pot_x = 250;
pot_y = 143;
pot_hit_radius = 50;

hovered_spice = -1;

dragging = false;
drag_type = -1;
drag_sprite = -1;

pot_layers = [];
has_spice = false;
has_item = false;
pot_failed = false;
done_button = noone;

if (audio_is_playing(Snd_PuqiShrine)) {
	audio_stop_sound(Snd_PuqiShrine);
}
audio_play_sound(snd_Boil, 1, true);