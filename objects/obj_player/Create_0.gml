/// @description Insert description here
// You can write your code in this editor

state = player_state_free;
lastState = state;
hitByAttack = -1;

hsp = 0;
vsp = 0;
accel = 0.2;
max_speed = 1;
grv = 0.125;
wlk = 1.5;

global.playerHP = 3;

//	new_textbox("Huh? What are you doing here?\nYou're supposed to go after Atraxia, aren't you?\nWell this clearly ain't the right direction.", 0);