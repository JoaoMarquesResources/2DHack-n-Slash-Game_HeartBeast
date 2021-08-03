/// @description desc
if (!instance_exists(other)) exit;
audio_play_sound(a_expr, 1, false);
with (other)
{
	experience++;
	if (experience >= max_experience)
	{
		level += 1;
		experience = experience - max_experience;
		max_experience += max_experience;
		strength += 5;
	}
	if (experience <= max_experience)
	{
		if (hp < max_hp)
		{
			hp += 5;
		}
	}
}
instance_destroy(); 