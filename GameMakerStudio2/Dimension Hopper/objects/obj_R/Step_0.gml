/// @description Insert description here
// You can write your code in this editor


if(obj_stam_shift.stamina == 0){
	image_alpha = 1;
}else{
	image_alpha = 0;
};

degs += del;
if(degs>360 or degs<0){
	degs = del * (-1);
};
image_xscale = 2 + 0.5*sin(degtorad(degs));
image_yscale = 2 + 0.5*sin(degtorad(degs));