/// @description desc
global.id = self.id
if (creator == noone || creator == other || ds_list_find_index(hit_objects, other) != -1)
{
	exit;
}
show_message(self); //other = gajo q bateu

other.hp -= damage;

//PROCURAR ONDE ESTA O CODIGO QUE FAZ COM QUE O KNIGHT PERCA VIDA E TAL

if (instance_exists(o_skeleton)) && (creator.object_index == o_skeleton) && (other.hp <= 0){
	o_skeleton.kills += 1; 
}
ds_list_add(hit_objects, other); //Guardando na lista         o id do objeto q colidiu
other.state = "knockback";
other.knockback_speed = knockback * image_xscale; //* image_xscale para virar certo

/*
show_debug_message(other.hp);
show_debug_message(ds_list_fin d_index(hit_objects, other))
show_debug_message(other); //objeto q leva com o hit box
show_debug_message(creator); //Criador do hit box