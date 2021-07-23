/// @description desc
// Horizontal Collision
if (place_meeting(x + hsp, y, o_Wall))
{
	repeat (abs(hsp) + 1)
	{
	    if (place_meeting(x + sign(hsp), y, o_Wall))
	    break;
	    x += sign(hsp);
	}
   hsp = 0;
}
x += hsp;