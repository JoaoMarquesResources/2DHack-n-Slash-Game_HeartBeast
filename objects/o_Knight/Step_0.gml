/// @description desc
switch(state)
{
	case "chase":
		#region Chase state
		createHitBox2 = true;
		set_state_sprite(s_knight_walk, 0.5, 0);
		if (!instance_exists(o_skeleton)) break;
		
		image_xscale = sign(o_skeleton.x - x);
		if (image_xscale == 0)
		{
			image_xscale = 1;
		}
		
		var distance_to_player = point_distance(x, y, o_skeleton.x, o_skeleton.y);
		if (distance_to_player > attack_range)
		{
			move_and_colide(image_xscale * chase_speed, 0);
		}
		else
		{
			createHitBox2 = true;
			state = "attack";
		}
		
		#endregion
		break;
		
	case "attack":
		#region Attack state
		set_state_sprite(s_knight_attack, 0.7, 0);
		
		if ((animation_hit_frame_range(3, 4)) && createHitBox2)
		{
			create_hitboxKnight(x, y, self, s_skeleton_attack_one_damage, 4, 4, 10, image_xscale);
			createHitBox2 = false;
		}
		
		if (image_index >= 10)
		{
			state = "chase";
		}
		
		#endregion
		break;
	
	case "knockback":
		#region Knockback state
		set_state_sprite(s_knight_hitstun, 0, 0);
		knockback_state(s_knight_hitstun, "chase");
		#endregion
		break;
	
	default:
		show_debug_message("--------------------State " + state + " does not exists-----------------");
		state = "chase";
		break;
}