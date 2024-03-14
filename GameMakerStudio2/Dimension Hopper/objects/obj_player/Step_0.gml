/// @description Insert description here
// Finite State Machine for player

// Update controlling variables by reading the keyboard
left = keyboard_check(vk_left) or keyboard_check(ord("A"));
right = keyboard_check(vk_right) or keyboard_check(ord("D"));
jump = keyboard_check_pressed(vk_space) and obj_stam_shift.stamina;
dash = keyboard_check(vk_shift) and obj_stam_shift.stamina;
peak = keyboard_check(ord("E"));

// Set movement related variables
horizontal_movement = right - left;

if(horizontal_movement != 0){
	sprite_index = spr_player_move_right
};

// Note last direction of movement for dashing direction
if(horizontal_movement != 0){
	dir = horizontal_movement;
	image_xscale = 2.5*dir;
};

// Check if touching ground or dimensional ground
grounded = place_meeting(x, y+1, obj_wall) or place_meeting(x, y+1, dimension_of_wall[global.dimension]);
if(obj_dimension_manager.gravity_world){
	if(!global.dimension){
		grounded = false;
	};
}


//check if idle and change sprite
if(horizontal_movement == 0 and grounded){
	sprite_index=spr_player_idle;
};
// Allow double jumping if grounded
if(grounded and (!place_meeting(x, y-1, obj_wall) or !place_meeting(x, y-1, dimension_of_wall[global.dimension]))){
	can_double_jump = 1;
	if(alarm[0] <1){
		can_dash = 1; // Allow dashing mid-air only once
	};
};



// Decide state for Finite State Machine
if(dash and can_dash){
	if(!place_meeting(x+dir, y, obj_wall) and !place_meeting(x+dir, y, dimension_of_wall[global.dimension])){
		state = list_of_states[1]; // "Dashing" state
	};
}else{
	state = list_of_states[0]; // "Moving" state
};

// Code for each state
switch(state){
	case list_of_states[0]: // "Moving" state
		if(keyboard_check(vk_nokey)){
			sprite_index=spr_player_idle;//idle animation for sprite
		}
		if(!place_meeting(x+xspeed*horizontal_movement, y, obj_wall) and !place_meeting(x+xspeed*horizontal_movement, y, dimension_of_wall[global.dimension])){ // Check if collision is not occuring
			x += xspeed * horizontal_movement; // Move object
		}else{
			// Close the gap between the wall and the player
			// DEBUG_0_Chinmaya: This is sheer brute-forcing, see if you can optimize this later
			while(!place_meeting(x+horizontal_movement, y, obj_wall) and !place_meeting(x+horizontal_movement, y, dimension_of_wall[global.dimension])){
				x += horizontal_movement; // Increment/decrement x position by 1 until colliding with wall
			};
		};
		
		// If jump button is pressed, assign jump velocity to yspeed
		if(jump and (!place_meeting(x, y-1, obj_wall) or !place_meeting(x, y-1, dimension_of_wall[global.dimension]))){
			if(grounded){
				yspeed = jump_speed;
				obj_stam_shift.stamina--;
				grounded = false;
				audio_play_sound(snd_jmp,0,false);
			}else if(can_double_jump){
				yspeed = jump_speed;
				obj_stam_shift.stamina--;
				can_double_jump = false;
				audio_play_sound(snd_jmp,0,false);
			};
		};
		
		// If not on ground, change y position based on yspeed
		if(yspeed != 0){
			// Update yposition code goes here
			if(!place_meeting(x, y-yspeed, obj_wall) and !place_meeting(x, y-yspeed, dimension_of_wall[global.dimension])){
				y -= yspeed;
			}else{
				while(!place_meeting(x, y-sign(yspeed), obj_wall) and !place_meeting(x, y-sign(yspeed), dimension_of_wall[global.dimension])){
					y -= sign(yspeed);
				};
			};
		};
		
		// Subtract gravity from velocity if not on ground
		if(!grounded){
			if(yspeed  > -1){
				yspeed -= grav_going_up;
			}else if(yspeed < 0){
				if(abs(yspeed) < terminal_speed){
					yspeed -= falling_grav;
				};
			};
		}else{
			yspeed = 0;
		};
		
		// DEBUG_1_Chinmaya: The code below will cause object to disappear when not moving
		//image_xscale = horizontal_movement; // Make object face the direction it is moving in
		
	break;
	case list_of_states[1]: // "Dashing" state
		// Prevent player from dadshing immediately afterwards
		can_dash = false;
		alarm[0] = room_speed/2; // Add a half second delay before you can dash again
		obj_stam_shift.stamina--;
		
		// Dash by changing x position
		xpos_offset = xspeed*dash_mult*dir;
		
		init_pos = x;
		final_pos = x+xpos_offset;
		//wall_at
		
		if(!place_meeting(x+xpos_offset, y, obj_wall) and !place_meeting(x+xpos_offset, y, dimension_of_wall[global.dimension])){
			x += xpos_offset; // Dash in the direction you are facing
		}else{
			while(!place_meeting(x+dir, y, obj_wall) and !place_meeting(x+dir, y, dimension_of_wall[global.dimension])){
				x += dir; // Increment/decrement x position by 1 until colliding with wall
			};
		};
		
		final_pos = x;
		if(init_pos != final_pos){
			fade_sprite = true;
			alarm[1] = room_speed/30;
		};
		
		audio_play_sound(snd_dsh,0,false);
	break;
	case list_of_states[3]:
	break;
}; 