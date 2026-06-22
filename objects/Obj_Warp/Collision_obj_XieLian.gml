if (targetRoom == undefined)
    exit;

// Call the base collision event to set the camera properties for the warp
event_inherited();
if (room != targetRoom) {
    var data = {
        room: targetRoom,
        x: targetX,
        y: targetY
    };

    obj_CameraManager.fade_out(obj_CameraManager.default_fade_speed, function(_d) {
        GAME_CAMERA.reset_all();
        room_goto(_d.room);
        obj_XieLian.x = _d.x;
        obj_XieLian.y = _d.y;

        // Small delay before fade in to allow the camera to update to the new room's settings
        obj_CameraManager.alarm[0] = 10;
    }, data);
}