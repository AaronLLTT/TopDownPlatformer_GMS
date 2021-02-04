/// @description Move self
//To create the drop-shadow effect, the box needs to move
//and then draw the shadow based off the ystart
//this solution works for static blocks
//if a block was to contiually be moving,
//the ystart would need to be stored in a variable
//and that would be used to draw the offset
//and the y would need to keep changing
y += z;