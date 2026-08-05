var _ui_can_show = !movement_locked || state == PLAYERSTATE.DASH;

if (_ui_can_show) {
    var _mx = device_mouse_x_to_gui(0);
    var _my = device_mouse_y_to_gui(0);

    draw_set_font(Font1);
    var _help_text = "H = Help";
    var _help_w = string_width(_help_text);
    var _help_h = string_height(_help_text);
    var _help_x = display_get_gui_width() - 14 - _help_w;
    var _help_y = 14;
    help_hover = point_in_rectangle(_mx, _my, _help_x, _help_y, _help_x + _help_w, _help_y + _help_h);

    if (!instance_exists(obj_HelpPopup)) {
        if (keyboard_check_pressed(ord("H")) || (help_hover && mouse_check_button_pressed(mb_left))) {
            instance_create_depth(0, 0, -99999, obj_HelpPopup);
        }
    }
	var _menu_text = "TAB or M = Main Menu";
	var _menu_w = string_width(_menu_text);
	var _menu_h = string_height(_menu_text);
	var _menu_x = display_get_gui_width() - 14 - _menu_w;
	var _menu_y = _help_y + _help_h + 6;
	menu_hover = point_in_rectangle(_mx, _my, _menu_x, _menu_y, _menu_x + _menu_w, _menu_y + _menu_h);
	var _menu_blocked = DIALOGUE_MANAGER.is_dialogue_active() || instance_exists(Obj_Inventory) || instance_exists(obj_HelpPopup) || instance_exists(obj_WishTextInput) || instance_exists(obj_WishConfirmPopup) || instance_exists(obj_KitchenUI) || instance_exists(obj_SanLangDialogueOptions);
	if (!_menu_blocked && (keyboard_check_pressed(vk_tab) || keyboard_check_pressed(ord("M")) || (menu_hover && mouse_check_button_pressed(mb_left)))) {
		scr_SaveData_SavePlayerAndInventory();
		obj_CameraManager.fade_out(0.5, function(_d) {
			room_goto(_d.room);
		}, { room : menu });
	}

    var _quest_text = scr_GetActiveQuestText();
    if (_quest_text != "") {
		var _icon_scale = 2;
		var _icon_w = sprite_get_width(spr_Quest) * _icon_scale;
		var _icon_h = sprite_get_height(spr_Quest) * _icon_scale;
		var _icon_x = display_get_gui_width() - 14 - _icon_w / 2;
		var _icon_y = _menu_y + _menu_h + 16 + _icon_h / 2;

        quest_hover = point_in_rectangle(_mx, _my,
            _icon_x - _icon_w / 2, _icon_y - _icon_h / 2,
            _icon_x + _icon_w / 2, _icon_y + _icon_h / 2);
    } else {
        quest_hover = false;
    }

    quest_slide_amount = lerp(quest_slide_amount, quest_hover ? 1 : 0, 0.2);
} else {
	help_hover = false;
	menu_hover = false;
	quest_hover = false;
	quest_slide_amount = lerp(quest_slide_amount, 0, 0.2);
}
if (instance_exists(obj_Dialogue)) {
    if (audio_is_playing(Snd_XielianWalk)) {
        audio_stop_sound(Snd_XielianWalk);
    }
    exit;
}

if (state == PLAYERSTATE.DEATH) {
    if (audio_is_playing(Snd_XielianWalk)) {
        audio_stop_sound(Snd_XielianWalk);
    }
    exit;
}

// Inventory toggle with I
if (!variable_global_exists("inventory_just_closed"))
    global.inventory_just_closed = false;

if (keyboard_check_pressed(ord("I")) && !movement_locked) {
    if (global.inventory_just_closed) {
        global.inventory_just_closed = false;
    } else if (instance_exists(Obj_Inventory)) {
        with (Obj_Inventory)
            instance_destroy();
	} else if (!instance_exists(Obj_Shop)) {
        instance_create_depth(0, 0, -9999, Obj_Inventory);
        audio_play_sound(snd_MenuOpen, 1, false);
	}

} else {
    // Clear the flag on any frame where I wasn't pressed
    global.inventory_just_closed = false;
}
if (keyboard_check(vk_left) || keyboard_check(vk_right) || keyboard_check(vk_up) || keyboard_check(vk_down)) {
    if (!audio_is_playing(Snd_XielianWalk)) {
        audio_play_sound(Snd_XielianWalk, 1, true);
    }
} else {
    if (audio_is_playing(Snd_XielianWalk)) {
        audio_stop_sound(Snd_XielianWalk);
    }
}



//music
#macro MUSIC_VOL_PUQI_VILLAGE	0.5
#macro MUSIC_VOL_PUQI_SHRINE	0.4
#macro MUSIC_VOL_FOREST			1.0
#macro MUSIC_VOL_WATER_TOWN		0.5
#macro MUSIC_VOL_QIRONG_CAVE	1.0
#macro MUSIC_VOL_BEGINNING		0.3

//Puqi Village
if (room == puqi_village) {
    if (!audio_is_playing(Snd_PuqiVillage)) {
        audio_sound_gain(Snd_PuqiVillage, 0, 0);
        audio_play_sound(Snd_PuqiVillage, 1, true);
        audio_sound_gain(Snd_PuqiVillage, MUSIC_VOL_PUQI_VILLAGE, 7000);
    }
} else {
    if (audio_is_playing(Snd_PuqiVillage)) {
        audio_stop_sound(Snd_PuqiVillage);
    }
}
//Puqi Shrine
if (room == Room_PuqiShrine && !global.suppress_room_music) {
    if (!audio_is_playing(Snd_PuqiShrine)) {
        audio_sound_gain(Snd_PuqiShrine, 0, 0);
        audio_play_sound(Snd_PuqiShrine, 1, true);
        audio_sound_gain(Snd_PuqiShrine, MUSIC_VOL_PUQI_SHRINE, 7000);
    }
} else {
    if (audio_is_playing(Snd_PuqiShrine)) {
        audio_stop_sound(Snd_PuqiShrine);
    }
}
//The Forest
if (room == forest) {
    if (!audio_is_playing(Snd_TheForest)) {
        audio_sound_gain(Snd_TheForest, 0, 0);
        audio_play_sound(Snd_TheForest, 1, true);
        audio_sound_gain(Snd_TheForest, MUSIC_VOL_FOREST, 7000);
    }
} else {
    if (audio_is_playing(Snd_TheForest)) {
        audio_stop_sound(Snd_TheForest);
    }
}
// Water Town
if (room == Water_Town) {
    if (!audio_is_playing(Snd_WaterTown)) {
        audio_sound_gain(Snd_WaterTown, 0, 0);
        audio_play_sound(Snd_WaterTown, 1, true);
        audio_sound_gain(Snd_WaterTown, MUSIC_VOL_WATER_TOWN, 7000);
    }
} else {
    if (audio_is_playing(Snd_WaterTown)) {
        audio_stop_sound(Snd_WaterTown);
    }
}
// Qi Rong cave
if (room == QirongCave) {
	if (!audio_is_playing(snd_QiRongCave)) {
		audio_sound_gain(snd_QiRongCave, 0, 0);
		audio_play_sound(snd_QiRongCave, 1, true);
		audio_sound_gain(snd_QiRongCave, MUSIC_VOL_QIRONG_CAVE, 7000);
	}
} else {
	if (audio_is_playing(snd_QiRongCave)) {
		audio_stop_sound(snd_QiRongCave);
	}
}
// Beginning
if (room == Room_Beginning) {
	if (!audio_is_playing(snd_Birds)) {
		audio_sound_gain(snd_Birds, 0, 0);
		audio_play_sound(snd_Birds, 1, true);
		audio_sound_gain(snd_Birds, MUSIC_VOL_BEGINNING, 7000);
	}
} else {
	if (audio_is_playing(snd_Birds)) {
		audio_stop_sound(snd_Birds);
	}
}if (room == Room_Beginning) {
	if (!audio_is_playing(snd_Beginning)) {
		audio_sound_gain(snd_Beginning, 0, 0);
		audio_play_sound(snd_Beginning, 1, true);
		audio_sound_gain(snd_Beginning, MUSIC_VOL_BEGINNING, 7000);
	}
} else {
	if (audio_is_playing(snd_Beginning)) {
		audio_stop_sound(snd_Beginning);
	}
}