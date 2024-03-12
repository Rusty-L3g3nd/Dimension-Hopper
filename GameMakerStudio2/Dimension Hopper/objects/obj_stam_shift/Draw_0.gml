/// @description Insert description here
// You can write your code in this editor

for(i=0;i<stamina_data[room-1];i++){
	if(stamina>i){
		subimg = 1;
		for(j=0;j<array_length(shift_data[room-1]);j++){
			if((i+1) == shift_data[room-1][j]){
				subimg = 2;
				//break;
			};
		};
	}else{
		subimg = 0;
	};
	draw_sprite(spr_stamina, subimg, 32+(64*i), 64);
};