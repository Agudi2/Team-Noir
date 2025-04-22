var explosion = instance_create_layer(x, y, "Instances", obj_explosion);
explosion.radius = 48;
explosion.explosion_sound = snd_grenade_explosion;
instance_destroy();