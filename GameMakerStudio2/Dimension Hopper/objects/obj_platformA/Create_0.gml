/// @description Insert description here
// You can write your code in this editor


// Inherit the parent event
event_inherited();


left = place_meeting(x-(sprite_width/2)-1, y, obj_platformA);
right = place_meeting(x+(sprite_width/2)+1, y, obj_platformA);

if(left){
	if(right){
		sprite_index = spr_platformA_mid;
	}else{
		sprite_index = spr_platformA_right;
	};
}else{
	sprite_index = spr_platformA_left;
};
