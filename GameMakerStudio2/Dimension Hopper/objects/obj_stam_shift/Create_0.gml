/// @description Insert description here
// You can write your code in this editor

window_set_fullscreen(true);

stamina_data = [4, 4, 4, 11, 2, 7, 9, 13, 9, 16, 6, 1, 7, 9, 8]; // This array stores how much stamina is alloted per level
shift_data = [[1], [4,3,2,1], [3,2,1], [11,10,8,6,3], [2,1], [5,4,2,1], [8,6], [11,9,7,5,3,1], [8,4], [12,8,4], [4,1], [1], [4,2,1], [7,6,5,3,1], [7, 5]]; // This array stores on what stamina level to change dimensions

dimension_change = 0;
shift_level = 0;