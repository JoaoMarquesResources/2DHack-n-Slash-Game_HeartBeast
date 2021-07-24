function move_and_colide(argumento, argumento2){
	if (!place_meeting(x + argumento, y, o_Wall))
	{
		x += argumento;
	}
	
	if (!place_meeting(x, y + argumento2, o_Wall))
	{
		y += argumento2;
	}
}