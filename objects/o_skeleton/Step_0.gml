/// @description desc
left = keyboard_check(ord("A"));
right = keyboard_check(ord("D"));
roll = keyboard_check(vk_space);
attack = keyboard_check(vk_shift);

var move = (right - left)
hsp = move * walkspd;

colX = place_meeting(x + (walkspd * sign(image_xscale)), y, o_Wall);

switch (state)
{
	case "move":
		#region Move State
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
		hsp = 0;
		//Go to move state
		if (image_index >= 4)
		{
			state = "move";
		}
		
		//Go to state attack
		if (attack && animation_hit_frame_range(2, 4))
		{
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
		
		hsp = 0;
		//Go to move state
		if (image_index >= 4)
		{
			state = "move";
		}
		
		//Go to state attack
		if (attack && animation_hit_frame_range(2, 4))
		{
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
}

//Fliping the player
if (hsp != 0) image_xscale = sign(hsp);