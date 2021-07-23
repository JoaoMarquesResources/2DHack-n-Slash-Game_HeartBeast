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
			image_speed = 0.6;
		}
		if (left && right) || (hsp = 0)
		{
			sprite_index = s_skeleton_idle;
			image_speed = 0.6;
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
		sprite_index = s_skeleton_roll;
		image_speed = 0.6;
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
		sprite_index = s_skeleton_attack_one;
		image_speed = 0.6;
		hsp = 0;
		if (image_index >= 4)
		{
			state = "move";
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
}

//Fliping the player
if (hsp != 0) image_xscale = sign(hsp);