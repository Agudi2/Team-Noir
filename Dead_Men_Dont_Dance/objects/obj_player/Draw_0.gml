if(walk_timer > 5) {
	draw_sprite_ext(spr_feet_PLACEHOLDER, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
}
draw_self();
draw_sprite_ext(weapon_sprite, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
