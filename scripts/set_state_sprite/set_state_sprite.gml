function set_state_sprite(sprite, _speed, index)
{
	if (sprite_index != sprite)
	{
		sprite_index = sprite;
		image_index = index;
		image_speed = _speed;
	}
}