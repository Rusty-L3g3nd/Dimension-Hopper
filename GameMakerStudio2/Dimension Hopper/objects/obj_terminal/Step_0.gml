/// @description Insert description here
// You can write your code in this editor

if(distance_to_object(obj_player) < 128 and drawn == 0){
	instance_create_layer(x, y -64, "Instances_foreground", obj_F);
	drawn = 1;
}else{
	drawn = 0;
};


login = keyboard_check_pressed(ord("F"));

if(login){
	if(place_meeting(x,y, obj_player)){
		if(attached){
			attached = 0;
		}else{
			attached = 1;
		};
	};
};

switch(attached){
	case 1:
		obj_player.x = x;
		obj_player.y = y;
		lt = (keyboard_check_pressed(ord("A")) or keyboard_check_pressed(vk_left));
		rt = (keyboard_check_pressed(ord("D")) or keyboard_check_pressed(vk_right));
		movement = rt - lt;
		if(movement != 0){
			var list = ds_list_create();
			var blocks = collision_rectangle_list(0, y-20, room_width, y+20, all, false, false, list, false);
			for(i = 0; i<blocks; i++){
				list[|i].x += 64*movement;
				if(list[|i].x>room_width){
					list[|i].x -= room_width;
				};
				if(list[|i].x<0){
					list[|i].x += room_width;
				};
			};
			ds_list_destroy(list);
		}
	break;
};