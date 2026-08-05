if (mode == SANLANG_MODE.FOLLOW) {
    sanlang_present = true;
    visible = true;

    if (instance_exists(obj_XieLian)) {
        var _desired_x = obj_XieLian.x + (facing == 1 ? -24 : 24);
        var _desired_y = obj_XieLian.y;
        var _free_pos = scr_SanLang_FindFreeSpot(_desired_x, _desired_y, obj_XieLian.x, obj_XieLian.y);
        x = _free_pos[0];
        y = _free_pos[1];
    }
    wander_target_x = x;
    wander_target_y = y;
}
else {
    sanlang_present = (room == area_room);
    visible = sanlang_present;
}