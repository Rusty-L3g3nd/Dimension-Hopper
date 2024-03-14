// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_tiler(){
	left = place_meeting(x-(sprite_width/2)-1, y, obj_platform);
	right = place_meeting(x+(sprite_width/2)+1, y, obj_platform);

	if(left){
		if(right){
			image_index = 1;
		}else{
			image_index = 2;
		};
	}else{
		image_index = 0;
	};

	image_speed = 0;
}