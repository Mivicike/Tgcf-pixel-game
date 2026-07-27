alarm[0] = room_speed * 10;

audio_play_sound(snd_Fountain, 1, true);
// 0 wait, 1 shake, 2 fade, 3 cutscene, 4 illustration fade-in, 5 dialogue, 6 done
intro_step = 0;

cutscene_frame = 0;
cutscene_speed = 15 / room_speed;
cutscene_playing = false;

target_x = 0;
target_y = 0;

depth = -20000;

fade_alpha = 0;
fade_timer = 0;
fade_duration = 5;

// The illustration that fades in after the cutscene
illustration_alpha = 0;
illustration_timer = 0;
illustration_fade_duration = 2;

intro_messages[0] = "A Heaven Official's Blessing inspired game.\nPress Z to continue";
intro_messages[1] = "This game does not contain the exact story of Heaven Official's Blessing but may have spoilers from specific scenes.\n\nMany assets are original and are not mentioned in TGCF while some are mentioned in the books but have been interpreted in our own way.\n\n Credits to Mo Xiang Tong Xiu for writing the amazing story of Heaven Official's Blessing.";
intro_messages[2] = "We hope you will enjoy playing our game!";

current_msg = 0;
text_alpha = 0;
text_fade_state = 1;
text_fade_duration = 0.5;
cutscene_alpha = 0;