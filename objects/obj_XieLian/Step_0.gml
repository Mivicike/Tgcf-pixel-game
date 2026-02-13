//Dialogue
if (instance_exists(Obj_Dialogue)) exit;


depth = -bbox_bottom;

switch (room){
	case puqi_village: 
		x = clamp(x, -272, room_width);
		y = clamp(y, -272, room_height);
		break;
	case forest:
		x = clamp(x, -423, room_width);
		y = clamp(y, 131, room_height);
		break;
			case Room_PuqiShrine:
		x = clamp(x, 0, room_width);
		y = clamp(y, 0, room_height);
		break;
			case Room_PuqiRestaurat:
		x = clamp(x, 255, room_width);
		y = clamp(y, 131, room_height);
		break;
}

// Switch statement to handle player state
switch (state) {
    case PLAYERSTATE.FREE:
        scr_PlayerStateFree();
		break;
	case PLAYERSTATE.ATTACK:
		scr_PlayerState_Attack();
        break;
	case PLAYERSTATE.DASH:
		scr_PlayerStateDash();
		break;
    // Add other cases for different player states if needed
}


// Call the function to handle player movement
collision_detection();

//camera
halfview_width = camera_get_view_width(view_camera[0]) / 2;
halfview_height = camera_get_view_height(view_camera[0]) / 2;

//camera_set_view_pos(view_camera[0], x - halfview_width, y - halfview_height);
// Calculate the desired camera position
var cam_x = x - halfview_width;
var cam_y = y - halfview_height;

// Clamp the camera position to ensure it doesn't move beyond the room's boundaries
switch (room){
	case puqi_village: 
		cam_x = clamp(cam_x, -271, room_width - halfview_width*2);
		cam_y = clamp(cam_y, -271, room_height - halfview_height*2);
		break;
	case forest:
		cam_x = clamp(cam_x, -424, room_width - halfview_width*2);
		cam_y = clamp(cam_y, 132, room_height - halfview_height*2);
		break;
}

// sounds Xie Lian

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
// Set the camera view position
camera_set_view_pos(view_camera[0], cam_x, cam_y);

//Life
if (keyboard_check(ord("A"))) {
    a_timer += 1;
    
    if (a_timer >= a_hold_time) {
        if (liv < max_liv) {
            liv += 1;
        }
        a_timer = 0;
    }
} else {
    a_timer = 0;
}
