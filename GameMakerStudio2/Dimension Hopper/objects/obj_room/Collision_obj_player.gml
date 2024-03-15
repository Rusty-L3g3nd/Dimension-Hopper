/// @description Insert description here
// You can write your code in this editor
audio_play_sound(snd_win,0,false);
if(room == 15){
	instance_destroy(all);
	room_goto(room_first);
}else{
	room_goto_next();
};