/// @description Controls
var left = keyboard_check(ord("A"));
var right = keyboard_check(ord("D"));
var up = keyboard_check(ord("W"));
var down = keyboard_check(ord("S"));
var jump = keyboard_check_pressed(vk_space);

//Basic x & y Movement
if (left) {
	xSpeed = -moveSpeed;
}
if (right) {
	xSpeed = moveSpeed;
}
if (up) {
	ySpeed = -moveSpeed;
}
if (down) {
	ySpeed = moveSpeed;
}

//Stop moving when keys are no longer being pressed
if (!up && !down) {
	ySpeed = 0;
}
if (!left && !right) {
	xSpeed = 0;
}

//Jumping in the z axis
if (jump && zSpeed == 0) {
	zSpeed = jumpSpeed;
}
//Gravity along the z axis
if (z != zFloor) {
	zSpeed += gameGravity;
}
//Snap back to the ground
if (z + zSpeed > zFloor) {
	zSpeed = 0;
	z = zFloor;
}

//Collisions
//We don't need to include z because the script checks it inside
if (PlaceMeeting3D(x + xSpeed, y, objSolid)) {
	//Get as close as possible before stopping
	while(!PlaceMeeting3D(x + sign(xSpeed), y, objSolid)) {
		x += sign(xSpeed);
	}
	xSpeed = 0;
}
if (PlaceMeeting3D(x, y + ySpeed, objSolid)) {
	while(!PlaceMeeting3D(x, y + sign(ySpeed), objSolid)) {
		y += sign(ySpeed);
	}
	ySpeed = 0;
}

//Tile Collisions
//We don't need to include z because the script checks it inside
if (TileMeeting3D(x + xSpeed, y, tiles)) {
	xSpeed = 0;
}
if (TileMeeting3D(x, y + ySpeed, tiles)) {
	ySpeed = 0;
}

//Update zFloor for objects
if (instance_place(x, y, objSolid)) {
	var block = instance_place(x, y, objSolid);
	//If we're higher than the block, send the shadow to the top of that block
	if (block.z >= z) {
		zFloor = block.z;
	}
	//Send shadow to the ground
	else {
		zFloor = 0;
	}
}
//Update the zFloor for tiles
else {
	//Loop through all the tile sets we're colliding with
	for(var i = 0; i < array_length(tiles); ++i) {
		//Check if we collide
		if (tilemap_get_at_pixel(tiles[i], x, y + (i + 1) * -16)) {
			//Update zFloor and stop
			zFloor = (i + 1) * -16;
			break;
		}
		//If no collisions, then we go back to the ground
		else {
			zFloor = 0;
		}
	}
}

//Hit the bottom of a block
if (instance_place(x, y, objSolid)) {
	var block = instance_place(x, y, objSolid);
	//This checks are for making sure we're below the block
	if (block && block.z > z + zSpeed && zFloor >= block.z) {
		if (zSpeed <= 0 && z > block.z) { //z > block.z ensures this change of zSpeed doesn't occur when we're above a block
			zSpeed = gameGravity;
		}
	}
}

//Move us along the axis' by our speeds
x += xSpeed;
y += ySpeed;
z += zSpeed;