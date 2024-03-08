/// @description Insert description here
// Initializing player variables

// Used for the finite state machine
list_of_states = ["Idle", "Moving", "Jumping", "Dashing"];
state = list_of_states[0];

// Movement speed related variables
xspeed = 5; // Horizontal movement speed
dash_mult = 3; // Multiply by xspeed and add to x for dashing
yspeed = 0; // Vertical movement speed
jump_speed = 50; // Velocity to be added when player attempts to jump

// Two gravity speeds, one for going up, other for falling down
// Falling down faster adds tightness to the platforming, prevents floatiness
// Gravity may be changed in different dimensions
grav_going_up = 10;
falling_grav = 15;

// Control related variables
left = 0;
right = 0;
jump = 0;
dash = 0;

// Decide which direction to move in, or not to move
horizontal_movement = right - left;
grounded = 0;
double_jump = 0;
can_dash = true;
dir = 1; // -1 for left, 1 for right