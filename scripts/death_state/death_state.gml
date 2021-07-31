function death_state(death_sprite, index)
{
	set_state_sprite(death_sprite, 0.25, 0);
	friction = true;
	
	if (image_index >= index)
	{
		image_index = image_number - 1;
		image_speed = 0;
		if (image_alpha > 0)
		{
			image_alpha -= 0.01;
		}
		else
		{
			instance_destroy();
		}
	}
	move_and_collide(knockback_speed, 0);
	knockback_speed = approach(knockback_speed, 0, 0.3);
}