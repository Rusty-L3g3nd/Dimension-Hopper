/// @description Insert description here
// You can write your code in this editor


if(room == 1){
	instance_destroy(all);
	room_goto(room_first);
}else{
	room_goto_previous();
};