function boss_knockback()
{
	move_and_collide(knockback_speed, 0);
	knockback_speed = approach(knockback_speed, 0, 0.3);
}