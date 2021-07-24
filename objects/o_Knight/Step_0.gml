/// @description desc
switch(state)
{
	case "chase":
		#region Chase state
		set_state_sprite(s_knight_walk, 0.4, 0);
		if (!instance_exists(o_skeleton)) break;
		
		image_xscale = sign(o_skeleton.x - x);
		if (image_xscale == 0)
		{
			image_xscale = 1;
		}
		
		var distance_to_player = point_distance(x, y, o_skeleton.x, o_skeleton.y);
		if (distance_to_player > 42)
		{
			move_and_colide(image_xscale * 1, 0);
		}
		
		#endregion
		break;
}