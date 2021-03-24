//@description Looks for a meeting in 3D space from the object calling it
//@param newX - The x location to check, usually it's x plus the speed of the player's x
//@param newY - The y location to check, usually it's y plus their y speed
//@param objet - Whichever object you want to check for a collision with
function PlaceMeeting3D(newX, newY, object) {
	//Block will hold a value of noone if there's no collision, or a real number
	//if it's a real number, then we have a collision
	var block = instance_place(newX, newY, object);
	
	//Keep the player under the block when jumping
	if (block && block.z < z) {
		depth = -bbox_bottom;
	}
	
	//!block means when there's no block
	//z <= block.z enforces the z axis collision, because the lower something is, the higher it is in the game world
	//so when our z is less than (<) block.z, we're either equal to it (standing on it) or above it
	//The zHeight >= block.z allows me to walk under tall blocks
	if (block == noone || (z <= block.z || zHeight >= block.z)) {
		return false; //Once we return, we leave the function
	}
	
	//We got here, so there is a collision
	return true;
}

///@description Looks for a collision with a tile in 3D space
//@param newX - The x location to check, usually it's x plus the speed of the player's x
//@param newY - The y location to check, usually it's y plus their y speed
//@param tiles - An array of tile sets (even if it's an array of size 1) you want to check for collisions with
function TileMeeting3D(newX, newY, tiles) {
	//This loop goes through all the tilesets that the player could collide with
	for(var i = 0; i < array_length(tiles); ++i) {
		
		//In this project, each tileset is 16 pixels higher on the z axis, so I set that here
		//I chose 16 because that's half the size of the tiles. To do more or less, adjust the tile
		//size as well
		var tileZ = (i + 1) * -16;
		
		//The first collision, essentially in 2D space. If this is false, then the 3D collision will also be
		//false, so we check this first
		var collision = tilemap_get_at_pixel(tiles[i], newX, newY + tileZ);
		
		//Update depth based on tile, altering the depth of the player when touching a tile with
		//their bottom and side collisions
		var bottomCollision = tilemap_get_at_pixel(tiles[i], objPlayer.x, bbox_bottom + ySpeed);
		var leftCollision = tilemap_get_at_pixel(tiles[i], bbox_left, bbox_bottom + ySpeed)
		var rightCollision = tilemap_get_at_pixel(tiles[i], bbox_right, bbox_bottom + ySpeed);
		if ((bottomCollision || leftCollision || rightCollision) && z - 1 >= tileZ) {
			depth = (i + 1) * 100; //Sets the player underneath the tile
			//I tried using tile_get_depth functions, but it kept returning unexpected values,
			//so I settled on this.
		}
		
		//If we did collide in 2D space, then check the 3D space next and return true if there is a collision
		if (collision > 0 && (z - 1 >= tileZ)) { //collision returns greater than 0 if it does find a collision
			//and the z - 1 is to allow the player to continue to move. Take it away and the player can't move
			//on top of a tile it's colliding with
			return true;
		}
	}
	//If we get here, then there were no 3D collisions
	return false;
}