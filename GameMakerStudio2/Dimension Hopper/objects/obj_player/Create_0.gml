/// @description Insert description here
// Initializing player variables

// Used for the finite state machine
//image_speed=0;

image_xscale = 1.5;
image_yscale = 1.5;
list_of_states = ["Moving", "Dashing","Idle"]; // "Jumping" and "Idle" merged with "Moving"
state = list_of_states[0];

// Dimension collision
dimension_of_wall = [obj_wallA, obj_wallB];
grid_size = 32;
obstacle_detected = 0;

// Movement speed related variables
xspeed = 10; // Horizontal movement speed
dash_mult = 30;//3; // Multiply by xspeed and add to x for dashing
yspeed = 0; // Vertical movement speed
jump_speed = 21; // Velocity to be added when player attempts to jump
terminal_speed = 64;

// Two gravity speeds, one for going up, other for falling down
// Falling down faster adds tightness to the platforming, prevents floatiness
// Gravity may be changed in different dimensions
grav_going_up = 2;
falling_grav = 3;

// Control related variables
left = 0;
right = 0;
jump = 0;
dash = 0;
peak = 0;

// Decide which direction to move in, or not to move
horizontal_movement = right - left;
grounded = 0;
can_double_jump = 0;
can_dash = true;
dir = 1; // -1 for left, 1 for right