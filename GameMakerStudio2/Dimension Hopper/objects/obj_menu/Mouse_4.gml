/// @description Insert description here
// You can write your code in this editor


/*if(image_index){
	image_index = 0;
}else{
	image_index = 1;
};*/

// Above code, but obfuscated to run without branching
image_index = 1 - image_index;
audio_sound_gain(sndID, image_index, 1000);