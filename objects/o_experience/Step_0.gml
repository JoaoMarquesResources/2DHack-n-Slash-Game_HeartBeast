/// @description desc
delay--;

if (delay <= 0)
{
	speed = 0;
	
	x = lerp(x, o_skeleton.x, 0.05);
	y = lerp(y, o_skeleton.y - random_range(5, 20), 0.05);
}
