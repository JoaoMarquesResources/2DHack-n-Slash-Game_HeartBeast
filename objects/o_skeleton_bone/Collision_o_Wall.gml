/// @description desc
if (vspeed > 1)
{
	vspeed *= -0.5; //bouncing
}
else
{
	vspeed = 0;
	while (!place_meeting(x, y, o_Wall))
	{
		y++;
	}
	gravity = 0;
	friction = 1;
}