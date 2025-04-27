var explosion = instance_create_layer(x, y, "Instances", obj_explosion);
explosion.radius = radius;
explosion.image_xscale = (radius*2)/96;
explosion.image_yscale = (radius*2)/96;
explosion.explosion_sound = snd_grenade_explosion;
explosion.circle_sound_range = 250;
explosion.timer = 15;
instance_destroy();