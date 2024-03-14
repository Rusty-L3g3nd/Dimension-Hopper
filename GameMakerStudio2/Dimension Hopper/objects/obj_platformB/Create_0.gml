/// @description Insert description here
// You can write your code in this editor



// Inherit the parent event
event_inherited();

left = place_meeting(x-(sprite_width/2)-1, y, obj_platformB);
right = place_meeting(x+(sprite_width/2)+1, y, obj_platformB);

if(left){
	if(right){
		sprite_index = spr_platformB_mid;
	}else{
		sprite_index = spr_platformB_right;
	};
}else{
	sprite_index = spr_platformB_left;
};
