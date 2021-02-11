// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
#macro grounded place_meeting(x, y + 1, obj_block)
#macro onPlatform place_meeting(x, y + 1, obj_platform)
global.thrown = 0;

function player_state_free() {
	sprite_index = spr_cralkenIdle;
	image_speed = 1;
	max_speed = 1;
	grv = 0.125;
	
	//Caculate Movement
	var move = ((global.key_right) - (global.key_left))*wlk;
	hsp = approach(hsp, max_speed*move, accel);
	vsp = approach(vsp, 7, grv);
	
	if (grounded || onPlatform) && (global.key_jump) {
		vsp = -2.65;
	}
	
	if !grounded && !onPlatform && vsp != 0 {
		sprite_index = spr_cralkenAir;
		if (sign(vsp) > 0) image_index = 0; else image_index = 1;
	}
	
	if (place_meeting(x, y, obj_bar)) {
		state = player_state_hanging;
	}
	
	if global.key_jump_hold && vsp > 0 {
		if !grounded {
			state = player_state_glide;
		}
	}
	
	if global.key_attack {
		state = player_state_punch;
	}
	
	if grounded && global.key_down && global.key_attack {
		state = player_state_throw_thing;
	}
	
	//Activate key logic
	if global.key_interract
	{
		//1. Check for an entity to activate.
		//2. If there is nothing, or there is something, but it has no script - Roll!
		//3. Otherwise, there is something and it has a script! Activate!
		//4. If the thing we activate is an NPC, make it face towards us.
	
		var _dirX;
		if image_xscale = 1 _dirX = 0; else _dirX = 180;
	
		var _activateX = lengthdir_x(16, _dirX);
		activate = instance_position(x + _activateX, y, par_npc);
		if (activate != noone) {
			script_execute_array(activate.entityActivateScript, activate.entityActivateArgs);
	
			//Make an NPC face the player
			if activate.entityNPC {
				with activate {
					if obj_player.x < x {
						image_xscale = -1;
					} else image_xscale = 1;
				}
			}
		}
	}
	//show_debug_message(string(image_index));
}

function player_state_hanging() {
	//For hanging on sideways poles.
	if (place_meeting(x, y, obj_bar)) {
		var bar = instance_place(x, y, obj_bar);
		y = bar.y + 4;
	}
	// 
	if !place_meeting(bbox_right + 10, y, obj_bar) {
		if image_xscale = 1 {
			sprite_index = spr_cralkenBarLD;
		} else {
			sprite_index = spr_cralkenBarRD;
		}
	} else if !place_meeting(bbox_left - 10, y, obj_bar) {
		if image_xscale = 1 {
			sprite_index = spr_cralkenBarRD;
		} else {
			sprite_index = spr_cralkenBarLD;
		}	
	} else sprite_index = spr_cralkenBar;
	max_speed = 0.4;
	vsp = 0;
	
	if hsp = 0 {
		image_speed = 0.35;
	} else image_speed = 1;
	
	var move = ((global.key_right) - (global.key_left))*wlk;
	hsp = approach(hsp, max_speed*move, accel);
	
	if (global.key_down) || (global.key_jump) || (!place_meeting(x, y, obj_bar)) {
		with (obj_bar) {
			sprite_index = -1;
		}
		if (global.key_jump) {
			vsp = -3;
		}
		alarm[0] = 10;
		state = player_state_free;
	}
}

function player_state_glide() {
	//Caculate Movement
	var move = ((global.key_right) - (global.key_left))*wlk;
	hsp = approach(hsp, max_speed*move, accel);
	vsp = approach(vsp, 7, grv);
	
	sprite_index = spr_cralkenFlap;
	image_speed = 1;
	vsp -= 0.122;
	
	if (place_meeting(x, y, obj_bar)) {
		state = player_state_hanging;
	}
	
	if grounded || !global.key_jump_hold {
		state = player_state_free;
	}
}

function player_state_punch() {
	//Basic attack. Use: attackBtn while in air or on ground with no horizontal movement.
	var move = ((global.key_right) - (global.key_left))*wlk;
	hsp = approach(hsp, max_speed*move / 5, accel);
	vsp = approach(vsp, 7, grv);
	
	sprite_index = spr_cralkenPunch;
	
	//Clear hit list
	if (!ds_exists(hitByAttack, ds_type_list)) hitByAttack = ds_list_create();
	ds_list_clear(hitByAttack);
	
	calc_attack(spr_cralkenPunchHB);
	
	var _totalFrames = sprite_get_number(sprite_index);
	if image_index >= _totalFrames - 1 {
		state = player_state_free;
	}
}

function player_state_air_strike() {
	//Running air attack. Use: A/D + attackBtn in air.
	
	sprite_index = spr_cralkenAirStrike;
	
	var _totalFrames = sprite_get_number(sprite_index);
	if image_index >= _totalFrames - 1 {
		state = player_state_free;
	}
}

function player_state_upper_cut() {
	//Attack from below. Use: W + attackBtn on ground or in air
	
	sprite_index = spr_cralkenUpperCut;
	
	var _totalFrames = sprite_get_number(sprite_index);
	if image_index >= _totalFrames - 1 {
		state = player_state_free;
	}
}

function player_state_down_smash() {
	//Attack from above. Use: S + attackBtn in air.
	
	sprite_index = spr_cralkenDownSmash;
	
	if grounded || global.key_jump {
		state = player_state_free;
	}
}

function player_state_hanging_punch() {
	//Attack from above. Use: attackBtn while on a horizontal bar.
	
	sprite_index = spr_cralkenBarPunch;
	
	var _totalFrames = sprite_get_number(sprite_index);
	if image_index >= _totalFrames - 1 {
		state = player_state_hanging;
	}
}

function player_state_throw_thing() {
	//Attack from above. Use: attackBtn while on a horizontal bar.
	
	hsp = 0;
	sprite_index = spr_cralkenPunch;
	
	var _totalFrames = sprite_get_number(sprite_index);
	if image_index >= _totalFrames - 2 {
		if global.thrown = 0 {
			instance_create_layer(x + (8*image_xscale), y - 6, "Instances", obj_throwObj);
			global.thrown = 1;
		}
	}
	if image_index >= _totalFrames - 1 {
		state = player_state_free;
		global.thrown = 0;
	}
}

function player_state_locked() {
	//Literally nothing... except.
	sprite_index = spr_cralkenIdle;
	image_speed = 1;
	hsp = 0;
}

function player_push() {
	if place_meeting(x + sign(hsp), y, obj_crate) && grounded {
		sprite_index = spr_cralkenPush;
		var block = instance_place(x + sign(hsp), y, obj_crate);
		with (block) {
			collisions_block(obj_player.hsp, 0);
		}
	}
}