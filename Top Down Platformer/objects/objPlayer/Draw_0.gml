/// @description Draw Myself

//Update depth before drawing self
depth = -bbox_bottom + z * 2;
//My shadow
draw_sprite(sprPlayerShadow, 0, x, y + zFloor);

//The player, with z axis
draw_sprite(sprPlayer, 0, x, y + z);

//Draw tiles
if (showTileCollisions) {
	for(var i = 0; i < room_width; i += 16) {
		for(var j = 0; j < room_height; j += 16) {
			//First tile set
			draw_set_color(c_green);
			draw_set_alpha(0.4);
			if (tilemap_get_at_pixel(tiles[0], i, j) > 0) {
				draw_rectangle(i, j, i + 16, j + 16, false);
			}
			draw_set_color(c_blue);
			draw_set_alpha(0.4);
			if (tilemap_get_at_pixel(tiles[1], i, j) > 0) {
				draw_rectangle(i, j, i + 16, j + 16, false);
			}
			draw_set_color(c_orange);
			draw_set_alpha(0.4);
			if (tilemap_get_at_pixel(tiles[2], i, j) > 0) {
				draw_rectangle(i, j, i + 16, j + 16, false);
			}
		}
	}
}