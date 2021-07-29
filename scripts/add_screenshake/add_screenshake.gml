function add_screenshake(intensity, duration)
{
	if (!instance_exists(o_Camera)) exit;
	
	with (o_Camera)
	{
		screenshake = intensity
		alarm[0] = duration;
	}
}