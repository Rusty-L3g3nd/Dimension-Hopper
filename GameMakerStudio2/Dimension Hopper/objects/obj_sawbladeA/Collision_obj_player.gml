/// @description Insert description here
// You can write your code in this editor

if(image_index == 1){ // If player is in the same dimension as the sawblade
	obj_player.state = obj_player.list_of_states[3];
	obj_player.fade_sprite = false;
	obj_player.xspeed = 0;
	obj_player.yspeed = 0;
	audio_play_sound(snd_die,0,false);
	room_restart(); // Restart the level
};
