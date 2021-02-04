/// @description Set up game camera

//A z-axis game needs a custom camera to follow the player when they
//jump, since that jump is not based on the y axis, an ordinary
//camera will not move up.
view_enabled = true;
global.Cameras = undefined;

#macro CameraWidth 256
#macro CameraHeight 144
#macro CameraScale 8
#macro CameraSpeed 0.1

window_set_fullscreen(false);
z = 10;

CreateCamera();