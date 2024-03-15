/// @description Insert description here
// You can write your code in this editor

degs += del;
if(degs>360){
	degs = 360;
	del = del * (-1);
}else if(degs<0){
	degs = 0;
	del = del * (-1);
};
y = home + 16*sin(degtorad(degs));

scale += scale_change;
if(scale>360 or scale<0){
	scale_change = scale_change * (-1);
};

image_xscale = sin(degtorad(scale));