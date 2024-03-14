/// @description Insert description here
// You can write your code in this editor

draw_self();

if(fade_sprite){
	for(i=0;i<2;i++){
			draw_sprite_ext(spr_player_move_right, i, init_pos+(xpos_offset/2)*i, y, image_xscale, image_yscale, 0, color[global.dimension], 0.25);
		};
};