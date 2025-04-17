var pickup = instance_create_layer(x, y, "Instances", obj_weapon_pickup);
pickup.sprite_index = sprite_index;
pickup.ammo = ammo;
instance_destroy();