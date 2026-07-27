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

if (keyboard_check_pressed(ord("I"))) {
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
if (room == Room_PuqiShrine) {
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
if (room == QirongCaveEntrance) {
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