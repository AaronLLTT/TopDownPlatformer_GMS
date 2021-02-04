/// @description Draw self & Shadow

//Shadow
if (z != -16) {
	draw_sprite(sprPlayerShadow, 0, x, ystart);
}

//Self at higher
depth = -bbox_bottom + z;
draw_sprite_ext(sprSolid, 0, x, ystart + z, image_xscale, image_yscale, image_angle, c_white, 1);

//Draw the collision mask
if (showCollisionMask) {
	draw_set_color(c_blue);
	draw_rectangle_color(bbox_left, bbox_top, bbox_right, bbox_bottom, c_blue, c_blue, c_blue, c_blue, false);
}