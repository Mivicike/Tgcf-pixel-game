/// @description Get the scale factor between the camera view and the GUI layer. This can be used to convert coordinates between the two spaces.
/// @return {array} An array containing the x and y scale factors between the camera view
function scr_GetGUIScale()
{
    var cam = view_camera[0];
    var cam_w = camera_get_view_width(cam);
    var cam_h = camera_get_view_height(cam);
    var gui_w = display_get_gui_width();
    var gui_h = display_get_gui_height();

    return [gui_w / cam_w, gui_h / cam_h];
}