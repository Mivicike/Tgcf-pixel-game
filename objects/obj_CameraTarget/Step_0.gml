// camera_set_view_target(view_camera[0], self);
// camera_set_view_border(view_camera[0], camera_get_view_width(view_camera[0]) - buffer, camera_get_view_height(view_camera[0]) - buffer);
// camera_set_view_speed(view_camera[0], -1, -1);

target_object = obj_XieLian;

// Lerp from current position TO target position (not backwards)
x = lerp(x, target_object.x, 0.5);
y = lerp(y, target_object.y, 0.5);

// Round camera target position for pixel-perfect camera
x = round(x);
y = round(y);

x = obj_XieLian.x;
y = obj_XieLian.y;

var expected_x = obj_XieLian.x - camera_get_view_width(view_camera[0]) / 2;
var expected_y = obj_XieLian.y - camera_get_view_height(view_camera[0]) / 2;

expected_x = clamp(expected_x, 0, room_width - camera_get_view_width(view_camera[0]));
expected_y = clamp(expected_y, 0, room_height - camera_get_view_height(view_camera[0]));

camera_set_view_pos(view_camera[0], expected_x, expected_y);