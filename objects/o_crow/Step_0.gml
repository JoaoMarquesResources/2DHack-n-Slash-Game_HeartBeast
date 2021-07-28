/// @description desc
switch(state)
{
	case "chase":
		if (!instance_exists(o_skeleton)) break;
		if (place_meeting(x, y, o_skeleton) && attacked = false && o_skeleton.state != "roll")
		{
			create_hitbox(x, y, self, sprite_index, knockback, 1, damage, image_xscale);
			attacked = true;
		}
		if (attacked) vspeed = -1;
		break;
}