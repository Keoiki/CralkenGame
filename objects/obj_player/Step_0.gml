/// @description Insert description here
// You can write your code in this editor

global.key_up = keyboard_check(ord("W")) || abs(min(gamepad_axis_value(0,gp_axislv),0));
global.key_left = keyboard_check(ord("A")) || abs(min(gamepad_axis_value(0,gp_axislh),0));
global.key_down = keyboard_check(ord("S")) || max(gamepad_axis_value(0,gp_axislv),0);
global.key_right = keyboard_check(ord("D")) || max(gamepad_axis_value(0,gp_axislh),0);
global.key_attack = keyboard_check(ord("R")) || gamepad_button_check(0, gp_face3);
global.key_jump = keyboard_check_pressed(vk_space) || gamepad_button_check_pressed(0, gp_face1);
global.key_jump_hold = keyboard_check(vk_space) || gamepad_button_check(0, gp_face1);
global.key_interract = keyboard_check(ord("E"));

if (hsp != 0) image_xscale = sign(hsp);

if mouse_check_button_pressed(mb_right)
{
	x = mouse_x;
	y = mouse_y;
}

script_execute(state);
player_push();
collisions();

if room != rm_worldSelect {
	if (layer_exists("Background"))
	{
		layer_x("Background",x/10);
		//	layer_y("Trees01",y/6);
	}
}