/// @description desc
left = keyboard_check(ord("A"));
right = keyboard_check(ord("D"));

var move = (right - left)
hsp = move * walkspd;

// Horizontal Collision
if (place_meeting(x + hsp, y, o_Wall))
{
	repeat (abs(hsp) + 1)
	{
	    if (place_meeting(x + sign(hsp), y, o_Wall))
	    break;
	    x += sign(hsp);
	}
   hsp = 0;
}

if (left || right)
{
	sprite_index = s_skeleton_run;
	image_speed = 0.6;
	x += hsp;
}
if (left && right) || (hsp = 0)
{
	sprite_index = s_skeleton_idle;
	image_speed = 0.6;
}

//Fliping the player
if (hsp != 0) image_xscale = sign(hsp);