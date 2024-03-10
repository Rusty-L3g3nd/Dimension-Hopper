// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_raycast(dim, other_axis_val, ray_start, ray_end, step_dist, obstacle){
	// Initialize some variables for calculations
	var ray_len = ray_end - ray_start;
	var dir = sign(ray_len);
	var loops = floor(abs(ray_len)/step_dist);
	var obstacle_detected = false;
	
	switch(dim){ // Detect dimension to look in for obstacles
		case "x":
			for(i=0;i<=loops;i++){
				if(!place_meeting(ray_start+(step_dist*i*dir), other_axis_val, obstacle)){
					obstacle_detected = true;
					break;
				}; 
			};
		
		break;
		case "y":
			for(i=0;i<=loops;i++){
				if(!place_meeting(other_axis_val, ray_start+(step_dist*i*dir), obstacle)){
					obstacle_detected = true;
					break;
				}; 
			};		
		break;
	};
	if(obstacle_detected){
		return((i-1)*step_dist); // If obstacle was detected, return last clear value for moving to
	}else{
		return(i*step_dist);	// Else say the whole path is clear
	};
};