/// @description desc
left = keyboard_check(ord("A"));
right = keyboard_check(ord("D"));
roll = keyboard_check(vk_space);

var move = (right - left)
hsp = move * walkspd;

colX = place_meeting(x + (walkspd * sign(image_xscale)), y, o_Wall);

switch (state)
{
	case "move":
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
	
		//Rolling
		if (roll)
		{
			image_index = 0;
			state = "roll";
		}
		break;
		
	case "roll":
		sprite_index = s_skeleton_roll;
		image_speed = 0.6;
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
		break;
}

//Fliping the player
if (hsp != 0) image_xscale = sign(hsp);