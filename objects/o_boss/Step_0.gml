/// @description desc
switch (state)
{
	case "chase":
		criar_hit_box = true;
		set_state_sprite(s_boss_walk, 0.2, 0);
		if (!instance_exists(o_skeleton)) break;
		
		image_xscale = sign(o_skeleton.x - x);
		if (image_xscale == 0)
		{
			image_xscale = 1;
		}
		
		var direction_facing = image_xscale;
		var distance_to_player = point_distance(x, y, o_skeleton.x, o_skeleton.y);
		
		if (distance_to_player <= attack_range && distance_to_player > backup_range) //se estamos no meio das duas, (as duas lá de baixo), state = attack
		{
			state = "attack";
		}
		
		if (distance_to_player > attack_range) //se estamos too far from the player, moved towards the player
		{
			image_xscale = sign(o_skeleton.x - x);
			if (image_xscale == 0)
			{
				image_xscale = 1;
			}
			move_and_collide(direction_facing * chase_speed, 0)
		}
		
		if (distance_to_player <= backup_range) //Se estamos too close to the player back up
		{
			if (direction_facing != sign(o_skeleton.x - x))
			{
				image_xscale = sign(o_skeleton.x - x);
				if (image_xscale == 0)
				{
					image_xscale = 1;
				}
			}
			move_and_collide(-direction_facing * chase_speed, 0)
		}
		
		boss_knockback();
		break;
	
	case "stall":
		set_state_sprite(s_boss_idle, 0.3, 0);
		if (alarm[1] <= 0)
		{
			state = "chase";
		}
		boss_knockback();
		break;
	
	case "attack":
		set_state_sprite(s_boss_attack, 0.5, 0);
		if (animation_hit_frame_range(7, 10) && criar_hit_box)
		{
			create_hitboxBoss(x, y, self, s_boss_attack_damage, 10, 3, 20, image_xscale);
			add_screenshake(10, 16);
			criar_hit_box = false;
		}
		
		if (image_index >= 14)
		{
			state = "stall";
			alarm[1] = 30;
		}
		boss_knockback();
		break;
	
	case "knockback":
		criar_hit_box = true;
		knockback_state(s_boss_idle, "chase");
		break;
		
	case "death":
		death_state(s_boss_die, 4);
		break;
}