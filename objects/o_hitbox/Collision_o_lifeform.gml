/// @description desc
show_debug_message("CONA");
if (creator == noone || creator == other || ds_list_find_index(hit_objects, other) != -1)
{
	exit;
}
show_debug_message(other.hp);
show_debug_message(other.max_hp);
show_debug_message(other);
other.hp -= damage;
if (instance_exists(o_skeleton))
{
	show_debug_message(o_skeleton.hp);
	if ((creator.object_index == o_skeleton) && (other.hp <= -1))
	{
		o_skeleton.kills += 1;
	}
	
	//object_index = 7;
	if (other.object_index = o_skeleton && other.hp <= -1)
	{
		show_debug_message("if")
		var number = sprite_get_number(s_skeleton_bones);
		
		for (var i = 0; i < number; i++)
		{
			show_debug_message("for loop")
			var bx = other.x + random_range(-8, 8);
			var by = other.y + random_range(-24, 8);
			var bone = instance_create_layer(bx, by, "Instances", o_skeleton_bone);
			bone.direction = 90 - (image_xscale * random_range(30, 60))
			bone.speed = random_range(3, 10);
			bone.image_index = i;
			if (i == 5) bone.image_angle = 130;
		}
	}
}
ds_list_add(hit_objects, other); //Guardando na lista         o id do objeto q colidiu
other.state = "knockback";
other.knockback_speed = knockback * image_xscale; //* image_xscale para virar certo

/*
show_debug_message(other.hp);
show_debug_message(ds_list_find_index(hit_objects, other))
show_debug_message(other); //objeto q leva com o hit box
show_debug_message(creator); //Criador do hit box