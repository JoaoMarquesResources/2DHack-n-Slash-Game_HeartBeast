/// @description desc
if (hp < 0)
{
	instance_destroy();
	
	repeat (experience)
	{
		instance_create_layer(x + random_range(-2, 2), y + random_range(-2, 2), "Effects", o_experience);
	}
}