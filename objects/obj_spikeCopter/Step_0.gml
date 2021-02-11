/// @description Insert description here
// You can write your code in this editor

y = obj_wave(y - 0.1, y + 0.1, dur, offs);

if obj_player.x < x
{
	image_xscale = -1;
} else image_xscale = 1;

if hp <= 0 {
	instance_destroy();
}