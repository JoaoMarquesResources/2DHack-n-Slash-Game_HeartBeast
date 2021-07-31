/// @description desc
parar_loop = true;
var enemy_count = instance_number(o_enemy_parent);

if (instance_exists(o_skeleton)) && (enemy_count < o_skeleton.kills / 4)
{
	if (enemy_count > 5)
	{
		exit;
	}
	
	var enemy = choose(o_Knight, o_crow);
	
	var new_x = random_range(240, room_width - 240);
	while ((point_distance(new_x, 0, o_skeleton.x, 0) < 200))
	{
		new_x = random_range(240, room_width - 240);
	}
	if (point_distance(new_x, 0, o_skeleton.x, 0) > 200)
	{
		new_x = new_x;
	}
	show_message("CRIA");
	instance_create_layer(new_x, o_skeleton.y, "Instances", enemy);
}