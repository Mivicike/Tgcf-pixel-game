/// @description OnClickEvent
if (target_room != noone)
    {
		var data = {
			room : target_room
		};
		
		obj_CameraManager.fade_out(0.1, function(_d) {
			room_goto(_d.room);
		}, data)
    }