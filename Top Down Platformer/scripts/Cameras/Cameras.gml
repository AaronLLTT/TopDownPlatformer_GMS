/// @description Create all the cameras
function CreateCamera() {

	var width = CameraWidth, height = CameraHeight, scale = CameraScale;

	view_visible[0] = true;
	
	global.Cameras[0] = camera_create_view(0, 0, width, height);
	camera_set_view_border(global.Cameras[0], width, height);
	view_set_camera(0, global.Cameras[0]);
	
	view_xport[0] = 0;
	view_yport[0] = 0;
	view_wport[0] = width;
	view_hport[0] = height;
			
	window_set_size(width * scale, height * scale);
	surface_resize(application_surface, width * scale, height * scale);
	window_set_position(150,100);
	display_set_gui_size(width * scale, height * scale);
}