/// @description desc
if (creator == noone || creator == other || ds_list_find_index(hit_objects, other) != -1)
{
	exit;
}

other.hp -= damage;
ds_list_add(hit_objects, other); //Guardando na lista o id do objeto q colidiu

show_debug_message(other.hp);
show_debug_message(ds_list_find_index(hit_objects, other))
show_debug_message(other); //objeto q leva com o hit box
show_debug_message(creator); //Criador do hit box