/// @description Data
//Our 3 speeds
xSpeed = 0;
ySpeed = 0;
zSpeed = 0;

//Movement modifiers
moveSpeed = 3;
jumpSpeed = -3.5;
gameGravity = 0.25;

//Z-axis variables
z = 0; //Where we are at on the z-axis
zHeight = -sprite_height / 2; //The height of our sprite's collision mask
zFloor = 0; //Where the floor is that we'll land on

//All the tiles to collide with
tiles[0] = layer_tilemap_get_id(layer_get_id("Tiles16"));
tiles[1] = layer_tilemap_get_id(layer_get_id("Tiles32"));
tiles[2] = layer_tilemap_get_id(layer_get_id("Tiles48"));

//Debugging
showTileCollisions = false;