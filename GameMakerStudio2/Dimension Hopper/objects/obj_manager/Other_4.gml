/// @description Insert description here
// You can write your code in this editor

/*for(i=0;i<3;i++){
	inst = instance_create_layer(room_width/2, 180+(360*i), "Fade", obj_fade);
	if(i%2){
		inst.hspeed = 100;
	}else{
		inst.hspeed = -100;
	};
};*/

speeds = [5, 10, 15]

for(i=2;i>=0;i--){
	inst = instance_create_layer(room_width/2, 180+(360*i), "Fade", obj_fade);
	inst.alarm[0] = speeds[i];
};