/// @description Insert description here
// You can write your code in this editor

if(obj_terminal.attached == 1){
	instance_destroy(self);
};

if(distance_to_object(obj_player)>128){
	instance_destroy(self);
};