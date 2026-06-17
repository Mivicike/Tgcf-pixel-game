//Dialogue
if (instance_exists(obj_Dialogue))
    exit;

if (state == PLAYERSTATE.DEATH) {
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

if (keyboard_check_pressed(ord("X"))) {
    var randSound = choose(Snd_Attack1, Snd_Attack2, Snd_Attack3);
    audio_play_sound(randSound, 1, false);
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
//Puqi Village
if (room == puqi_village) {
    if (!audio_is_playing(Snd_PuqiVillage)) {
        audio_play_sound(Snd_PuqiVillage, 1, true);
    }
} else {
    if (audio_is_playing(Snd_PuqiVillage)) {
        audio_stop_sound(Snd_PuqiVillage);
    }
}

//Puqi Shrine
if (room == PuqiShrine) {
    if (!audio_is_playing(Snd_PuqiShrine)) {
        audio_play_sound(Snd_PuqiShrine, 1, true);
    }
} else {
    if (audio_is_playing(Snd_PuqiShrine)) {
        audio_stop_sound(Snd_PuqiShrine);
    }
}
//The Forest
if (room == forest) {
    if (!audio_is_playing(Snd_TheForest)) {
        audio_play_sound(Snd_TheForest, 1, true);
    }
} else {
    if (audio_is_playing(Snd_TheForest)) {
        audio_stop_sound(Snd_TheForest);
    }
}
// Water Town
if (room == Snd_WaterTown) {
    if (!audio_is_playing(Snd_WaterTown)) {
        audio_play_sound(Snd_WaterTown, 1, true);
    }
} else {
    if (audio_is_playing(Snd_WaterTown)) {
        audio_stop_sound(Snd_WaterTown);
    }
}