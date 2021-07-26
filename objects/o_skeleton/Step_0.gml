/// @description desc
left = keyboard_check(ord("A"));
right = keyboard_check(ord("D"));
roll = keyboard_check_pressed(vk_space);
attack = keyboard_check_pressed(vk_shift);

var move = (right - left)
hsp = move * walkspd;

colX = place_meeting(x + (walkspd * sign(image_xscale)), y, o_Wall);

switch (state)
{
	case "move":
		#region Move State
		createHitBox = true;
		if (left || right)
		{
			sprite_index = s_skeleton_run;
			image_speed = 0.7;
		}
		if (left && right) || (hsp = 0)
		{
			sprite_index = s_skeleton_idle;
			image_speed = 0.5;
		}
		
		//Go to state attack
		if (attack)
		{
			createHitBox = true;
			image_index = 0;
			state = "attack one";
		}
		
		//Go to state Rolling
		if (roll)
		{
			image_index = 0;
			state = "roll";
		}
		#endregion
		break;
		
	case "roll":
		#region Roll State
		createHitBox = true;
		set_state_sprite(s_skeleton_roll, 0.7, 0);
		//Go to state move
		if (image_index >= 6)
		{
			state = "move";
			image_index = 0;
		}
		if (!colX)
	    {
	        var _speedRoll = sign(image_xscale) * walkspd;
	        hsp = lengthdir_x(_speedRoll, direction);
	    }
		
		#endregion
		break;
	
	case "attack one":
		#region Attack state
		set_state_sprite(s_skeleton_attack_one, 0.7, 0);
		
		if ((animation_hit_frame_range(0, 4)) && createHitBox)
		{
			create_hitbox(x, y, self, s_skeleton_attack_one_damage, 3, 4, 5, image_xscale);
			createHitBox = false;
		}
		
		hsp = 0;
		//Go to move state
		if (image_index >= 4)
		{
			state = "move";
		}
		
		//Go to state attack
		if (attack && animation_hit_frame_range(1, 4))
		{
			createHitBox = true;
			state = "attack two";
		}
		
		//Go to state Rolling
		if (roll)
		{
			image_index = 0;
			state = "roll";
		}
		#endregion
		break;
	
	case "attack two":
		#region Attack state 2
		set_state_sprite(s_skeleton_attack_two, 0.7, 0);
		
		if ((animation_hit_frame_range(1, 4)) && createHitBox)
		{
			create_hitbox(x, y, self, s_skeleton_attack_two_damage, 3, 4, 5, image_xscale);
			createHitBox = false;
		}
		
		hsp = 0;
		//Go to move state
		if (image_index >= 4)
		{
			state = "move";
		}
		
		//Go to state attack
		if (attack && animation_hit_frame_range(2, 4))
		{
			createHitBox = true;
			state = "attack three";
			image_index = 0;
		}
		
		//Go to state Rolling
		if (roll)
		{
			image_index = 0;
			state = "roll";
		}
		#endregion
		break;
		
	case "attack three":
		#region Attack state three
		set_state_sprite(s_skeleton_attack_three, 0.7, 0);
		
		if ((animation_hit_frame_range(2, 5)) && createHitBox)
		{
			create_hitbox(x, y, self, s_skeleton_attack_three_damage, 5, 4, 5, image_xscale);
			createHitBox = false;
		}
		
		hsp = 0;
		//Go to move state
		if (image_index >= 5)
		{
			state = "move";
		}
		
		//Go to state Rolling
		if (roll)
		{
			image_index = 0;
			state = "roll";
		}
		#endregion
		break;
		
	default:
		show_debug_message("---------------------State " + state + " does not exists-------------------------");
		state = "move";
		break;
}
show_debug_message("-------------------" + string(createHitBox) + "-------------------")
//Fliping the player
if (hsp != 0) image_xscale = sign(hsp);