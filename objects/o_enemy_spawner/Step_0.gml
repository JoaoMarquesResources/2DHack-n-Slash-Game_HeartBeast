/// @description desc
parar_loop = true;
var enemy_count = instance_number(o_enemy_parent);

if (instance_exists(o_skeleton)) && (enemy_count < o_skeleton.kills / 4)
{
	if (enemy_count > 5)
	{
		exit;
	}
	
	var enemy = choose(o_Knight, o_crow, o_crow);
	
	var new_x = random_range(220, room_width - 220);
	while ((point_distance(new_x, 0, o_skeleton.x, 0) < 200))
	{
		new_x = random_range(220, room_width - 220);
	}
	if (point_distance(new_x, 0, o_skeleton.x, 0) > 200)
	{
		new_x = new_x;
	}
	instance_create_layer(new_x, o_skeleton.y, "Instances", enemy);
}