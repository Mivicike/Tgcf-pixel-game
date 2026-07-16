gui_w = display_get_gui_width();
gui_h = display_get_gui_height();

credits_lines = [
    "Credits", "",
    "Head developer: Mivicike (Elvira Varga)", "",
    "Art",
    "Mivicike",
    "wolf22403, Instagram",
    "cold.mint.art, Instagram",
    "jaysomething7909, Discord",
    "redjay_, Discord",
    "scrivvle74, Discord", "",
    "Code",
    "Mivicike",
    "dabbie., Discord (Hazal Kara)",
    "John F, Fiverr",
    "azariya, Discord", "",
    "Music",
    "lilyychung, TikTok (Lily Chung)",
    "jaysomething7909, Discord",
    "weiwei8334_, Discord", "",
    "Sounds",
    "Pixabay"
];

draw_set_font(Font1);
line_height = string_height("Ay") + 6;

visible_top    = 20;
visible_bottom = gui_h - 100;
visible_h      = visible_bottom - visible_top;

total_h    = array_length(credits_lines) * line_height;
max_scroll = max(0, total_h - visible_h);
scroll_y   = 0;
scroll_speed = 12;

back_button = instance_create_depth(gui_w / 2 - 32 + 32, gui_h - 60, -10001, obj_ButtonBack_FromCredits);
back_button.owner_popup = id;