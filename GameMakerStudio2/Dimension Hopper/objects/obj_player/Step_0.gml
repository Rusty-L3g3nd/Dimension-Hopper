/// @description Insert description here
// Finite State Machine for player

// Update controlling variables by reading the keyboard


left = keyboard_check(vk_left) or keyboard_check(ord("A"));
right = keyboard_check(vk_right) or keyboard_check(ord("D"));
jump = keyboard_check(vk_space);
dash = keyboard_check(vk_shift);
peak = keyboard_check(ord("E"));

horizontal_movement = right - left;
vertical_movement = -1*jump;

if(horizontal_movement != 0){
	dir = horizontal_movement;
};

// Decide state for Finite State Machine
if(dash and can_dash){ // If the player presses a horizontal movement key
	state = list_of_states[3]; // "Dashing" state
}else if(horizontal_movement != 0){
	state = list_of_states[1]; // "Moving" state
}else{
	state = list_of_states[0]; // "Idle" state
};
		

// Code for each state
switch(state){
	case list_of_states[0]: // "Idle" state
		// Code to execute when idling		
	break;	
	case list_of_states[1]: // "Moving" state
		if(!place_meeting(x+xspeed*horizontal_movement, y, obj_wall)){ // Check if collision is not occuring
			x=move(); // Move object
		}else{
			// Close the gap between the wall and the player
			// DEBUG_0_Chinmaya: This is sheer brute-forcing, see if you can optimize this later
			while(!place_meeting(x+horizontal_movement, y, obj_wall)){
				x += horizontal_movement; // Increment/decrement x position by 1 until colliding with wall
			};
		};
		
		// DEBUG_1_Chinmaya: The code below will cause object to disappear when not moving
		//image_xscale = horizontal_movement; // Make object face the direction it is moving in
		
	break;
	case list_of_states[2]:
		if(grounded and jump){
			grounded=0
			jumping()
			grounded=1
		}
		else if(!grounded and jump){
			if(double_jump){
				jumping()
			}
			//else{}
		}
		
	case list_of_states[3]:
		can_dash = false;
		alarm[0] = room_speed/2; // Add a half second delay before you can dash again
		yspeed = 0;
		if(!place_meeting(x+(xspeed*dash_mult*dir), y, obj_wall)){
			x += xspeed*dash_mult*dir; // Dash in the direction you are facing
		}else{
			while(!place_meeting(x+dir, y, obj_wall)){
				x += dir; // Increment/decrement x position by 1 until colliding with wall
			};
		};
	break;
};