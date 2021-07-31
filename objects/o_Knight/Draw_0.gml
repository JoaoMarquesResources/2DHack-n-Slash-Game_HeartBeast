/// @description desc
draw_self();
with (global.knight)
{
	draw_self();
	global.delay--;
	if (state == "death") exit;
	if (global.delay > 0)
	{
		var height = sprite_height;
		draw_rectangle_color(x - 12, y - height, x - 12 + (hp / max_hp) * 24, y - (height - 2), c_white, c_white, c_white, c_white, false);
	    draw_sprite(s_enemy_healthbar, 0, x - 12, y - height);
	}
}

//FAZER A CENA DA VIDA N ESTAR NOIS DOIS, MAS é lixado, acho q vai ficar assim e pronto