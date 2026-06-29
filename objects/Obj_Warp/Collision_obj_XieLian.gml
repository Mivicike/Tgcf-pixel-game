if (targetRoom == undefined || !enabled)
    exit;

// Call the base collision event to set the camera properties for the warp
event_inherited();
if (room != targetRoom) {
    var data = {
        room: targetRoom,
        x: targetX,
        y: targetY
    };

    if (obj_CameraManager.fade_state != FADE_STATE.FADING_OUT) {
        show_debug_message($"Warping to room: {targetRoom}, x: {targetX}, y: {targetY}. Camera state: {obj_CameraManager.fade_state}");
        obj_CameraManager.fade_out(.5, function(_d) {
                GAME_CAMERA.reset_all();
                room_goto(_d.room);
                obj_XieLian.x = _d.x;
                obj_XieLian.y = _d.y;
            }, data);
    }
}