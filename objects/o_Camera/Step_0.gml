/// @description desc
if (!instance_exists(o_skeleton)) exit;

var target_x = o_skeleton.x + random_range(-screenshake, screenshake);
var target_y = o_skeleton.y - 48 + random_range(-screenshake, screenshake);

x = lerp(x, target_x, 0.2)
y = lerp(y, target_y - 48, 0.2);

camera_set_view_pos(view_camera[0], x - width / 2, y - height / 2);