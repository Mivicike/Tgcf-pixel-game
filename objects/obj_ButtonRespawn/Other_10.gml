/// @description OnClick Event
if (target_room != noone)
{
    // Clear up
	var data = {
		splash : obj_DeathSplash,
		me : self,
		room : target_room
	}
		
	obj_CameraManager.fade_out(.1, function(_d)
	{
	    room_goto(_d.room);
	}, data)
        
}