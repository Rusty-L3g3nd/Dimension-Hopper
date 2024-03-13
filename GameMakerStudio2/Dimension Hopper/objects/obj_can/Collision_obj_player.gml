/// @description Insert description here
// You can write your code in this editor

obj_stam_shift.stamina++;

for(i=0;i<array_length(obj_stam_shift.shift_data[room-1]);i++){
	if(obj_stam_shift.stamina == obj_stam_shift.shift_data[room-1][i]){
		global.dimension = 1-global.dimension;
		audio_play_sound(snd_dimension_chng, 0, false);
		break;
	};
};

instance_destroy(self);