function create_hitbox(x, y, creator, sprite, knockback, lifespan, damage, xscale)
{
	var hitbox = instance_create_layer(x, y, "Instances", o_hitbox);
	hitbox.mask_index = sprite;
	hitbox.creator = creator;
	hitbox.knockback = knockback;
	hitbox.alarm[0] = lifespan;
	hitbox.damage = damage;
	hitbox.image_xscale = xscale;
}