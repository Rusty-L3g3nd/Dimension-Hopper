/// @description Insert description here
// You can write your code in this editor

// Draw faded sprites for dash effect
if(fade_sprite){
	for(i=0;i<2;i++){
			draw_sprite_ext(spr_player_move_right, i, init_pos+(xpos_offset/2)*i, y, image_xscale, image_yscale, 0, color[global.dimension], 0.25);
		};
};

// Draw idle sprite
if(keyboard_check(vk_nokey) and grounded){
	sprite_index = spr_idle3;
	anim_state = "Idle";
};

// Running sprites
image_xscale = 2.5*dir;
if(horizontal_movement != 0 and grounded){
	sprite_index = spr_run_loop;
};

if(!grounded){
	if(yspeed > -1){
		sprite_index = spr_jmp_loop;
	}else{
		sprite_index = spr_fall_loop;
	};
};


if(instance_exists(obj_terminal)){
	if(obj_terminal.attached){
		sprite_index = spr_player_idle;
	};
};

draw_self();