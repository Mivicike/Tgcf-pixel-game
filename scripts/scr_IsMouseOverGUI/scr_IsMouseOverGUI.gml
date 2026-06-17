/// @description Return true if the mouse is over the given area on the GUI
/// @param {Real} _x The x position of the area to check
/// @param {Real} _y The y position of the area to check
/// @param {Real} _width The width of the area to check
/// @param {Real} _height The height of the area to check
function scr_IsMouseOverGUI(_x, _y, _width, _height)
{
    var pos = scr_ConvertWorldToGUI(mouse_x, mouse_y);
    var mx = pos[0];
    var my = pos[1];

    if (mx > _x && mx < _x + _width &&
        my > _y && my < _y + _height)
    {
        return true;
    }

    return false;
}