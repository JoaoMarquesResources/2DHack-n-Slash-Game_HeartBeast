/// @description desc
if (creator == noone || creator == other || ds_list_find_index(hit_objects, other) != -1)
{
	exit;
}

other.hp -= damage;
audio_play_sound(a_medium_hit, 4, false);other.hp -= damage;

repeat (10)
{
	instance_create_layer(other.x, other.y - 12, "Effects", o_hit_effect);
}

if (instance_exists(o_skeleton)) && (creator.object_index == o_skeleton) && (other.hp <= -1){
	o_skeleton.kills += 1;
}

if (object_index != o_skeleton)
{
	other.state = "death"; 
	o_enemy_parent.alarm[0] = 120;
	add_screenshake(2, 5);
}

ds_list_add(hit_objects, other); //Guardando na lista o id do objeto q colidiu
other.state = "knockback";
other.knockback_speed = knockback * image_xscale; //* image_xscale para virar certo

/*
show_debug_message(other.hp);
show_debug_message(ds_list_find_index(hit_objects, other))
show_debug_message(other); //objeto q leva com o hit box
show_debug_message(creator); //Criador do hit box