/// @description Manual Controls
var cameraX = camera_get_view_x(global.Cameras[0]);
var cameraY = camera_get_view_y(global.Cameras[0]);

var targetX = x - CameraWidth / 2;
//Include the z so the camera moves up when the player jumps
var targetY = y + z - CameraHeight / 2;

//Clamp
targetX = clamp(targetX, 0, room_width - CameraWidth);
targetY = clamp(targetY, 0, room_height - CameraHeight);

//Smooth Move
cameraX = lerp(cameraX, targetX, CameraSpeed);
cameraY = lerp(cameraY, targetY, CameraSpeed);

//Apply Changes
camera_set_view_pos(global.Cameras[0], cameraX, cameraY);