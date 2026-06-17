/// @description Convert world coordinates to GUI coordinates
/// @param {real} _x The x coordinate in world space.
/// @param {real} _y The y coordinate in world space.
/// @return {array} An array containing the x and y coordinates in GUI space.
function scr_ConvertWorldToGUI(_x, _y)
{
    // Convert the obj_cursor position to GUI coordinates
    var cam = view_camera[0];
    var cam_x = camera_get_view_x(cam);
    var cam_y = camera_get_view_y(cam);
    var gui_scale = scr_GetGUIScale();

    // Convert its position to GUI space
    var mx = (_x - cam_x) * gui_scale[0];
    var my = (_y - cam_y) * gui_scale[1];

    return [mx, my];
}