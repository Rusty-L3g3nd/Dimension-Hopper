/// @description Insert description here
// You can write your code in this editor

if(stamina < shift[shift_level] and dimension_change == 1){
	if(!place_meeting(obj_player.x, obj_player.y, obj_wall) and !place_meeting(obj_player.x, obj_player.y, obj_player.dimension_of_wall[1-global.dimension])){
		global.dimension = 1 -global.dimension;
		dimension_change = 0;


	



		if(shift_level < (array_length(shift)-1)){
			shift_level++;
		};
	};   
};

if(stamina == shift[shift_level]){
	dimension_change = 1;

};