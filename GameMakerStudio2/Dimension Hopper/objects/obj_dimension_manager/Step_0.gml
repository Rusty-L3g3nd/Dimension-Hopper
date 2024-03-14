/// @description Insert description here
// You can write your code in this editor

if(gravity_world){
	switch(global.dimension){
	case 0:
		with(obj_player){
			grav_going_up = -0.1;
			falling_grav = -0.1;
			terminal_speed = 16;
		};
	break;
	default:
		with(obj_player){
			grav_going_up = 2;
			falling_grav = 3;
			terminal_speed = 64;
		};
	break;
};
}