/// @description Insert description here
// You can write your code in this editor

if(stamina < shift[shift_level] and dimension_change == 1){
	if(!place_meeting(obj_player.x, obj_player.y, obj_wall) and !place_meeting(obj_player.x, obj_player.y, obj_player.dimension_of_wall[1-global.dimension])){
		global.dimension = 1 -global.dimension;
		dimension_change = 0;
<<<<<<< HEAD
	};  
	audio_play_sound(snd_dimension_chng,0,false);
=======
		if(shift_level < (array_length(shift)-1)){
			shift_level++;
		};
	};   
};

if(stamina == shift[shift_level]){
	dimension_change = 1;
>>>>>>> c29175b4e89a98e720c377894f0acbbe061824cd
};