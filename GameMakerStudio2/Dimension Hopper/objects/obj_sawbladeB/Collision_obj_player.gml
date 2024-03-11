/// @description Insert description here
// You can write your code in this editor

if(image_index == 0){ // If player is in the same dimension as the sawblade
	audio_play_sound(snd_die,0,false);
	room_restart(); // Restart the level
};