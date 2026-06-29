/// @description OnClickEvent
if (target_room != noone)
{
	var data = {
		room : target_room
	};

	obj_CameraManager.fade_out(.5, function(_d) {
		if (scr_LoadGame(global.current_save_slot)) {
			room_goto(global.save_data.player.room);
		} else {
			room_goto(_d.room);
		}
	}, data)
}