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

function create_hitboxKnight(x, y, creator, sprite, knockback, lifespan, damage, xscale)
{
	var hitbox = instance_create_layer(x, y, "Instances", o_hitboxKnight);
	hitbox.mask_index = sprite;
	hitbox.creator = creator;
	hitbox.knockback = knockback;
	hitbox.alarm[0] = lifespan;
	hitbox.damage = damage;
	hitbox.image_xscale = xscale;
}

function create_hitboxCrow(x, y, creator, sprite, knockback, lifespan, damage, xscale)
{
	var hitbox = instance_create_layer(x, y, "Instances", o_hitboxCrow);
	hitbox.mask_index = sprite;
	hitbox.creator = creator;
	hitbox.knockback = knockback;
	hitbox.alarm[0] = lifespan;
	hitbox.damage = damage;
	hitbox.image_xscale = xscale;
}

function create_hitboxBoss(x, y, creator, sprite, knockback, lifespan, damage, xscale)
{
	var hitbox = instance_create_layer(x, y, "Instances", o_hitboxBoss);
	hitbox.mask_index = sprite;
	hitbox.creator = creator;
	hitbox.knockback = knockback;
	hitbox.alarm[0] = lifespan;
	hitbox.damage = damage;
	hitbox.image_xscale = xscale;
}