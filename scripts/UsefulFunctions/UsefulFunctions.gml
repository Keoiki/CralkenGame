// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
#macro resW 288
#macro resH 162
global.worldSel = 0;
global.movement = false;
global.destination = 0;
global.textSpeed = 0.45;
global.stageData = array_create(70);
global.stageData[0] = 1;
global.stageName = "";
cursor_sprite = spr_cursor;
window_set_cursor(cr_none);

function approach(_from, _to, _byamount) {
	/// Approach(a, b, amount)
	// Moves "a" towards "b" by "amount" and returns the result
	// Nice because it will not overshoot "b", and works in both directions
	// Examples:
	//      speed = Approach(speed, max_speed, acceleration);
	//      hp = Approach(hp, 0, damage_amount);
	//      hp = Approach(hp, max_hp, heal_amount);
	//      x = Approach(x, target_x, move_speed);
	//      y = Approach(y, target_y, move_speed);

	if (_from < _to)
	{
	    _from += _byamount;
	    if (_from > _to)
	        return _to;
	}
	else
	{
	    _from -= _byamount;
	    if (_from < _to)
	        return _to;
	}
	return _from;
}

function obj_wave(_from, _to, _duration, _offset) {
	var a4 = (_to - _from) * 0.5;
	return _from + a4 + sin((((current_time * 0.001) + _duration * _offset) / _duration) * (pi*2)) * a4;
}

function nine_slice_box_stretched(_sprite, _x1, _y1, _x2, _y2, _index) {
	//To make things easier for you guys (commented in case you get this line): 
	///@desc NineSliceBoxStretched(sprite, x1, y1, x2, y2)
	///@arg sprite
	///@arg x1 left
	///@arg y1 top
	///@arg x2 right
	///@arg y2 bottom
	///@arg index image index
	
	var _size = sprite_get_width(_sprite) / 3;
	var _w = _x2 - _x1;
	var _h = _y2 - _y1

	//MIDDLE
	draw_sprite_part_ext(_sprite, _index, _size, _size, 1, 1, _x1 + _size,_y1 + _size, _w - (_size * 2), _h - (_size * 2), c_white,1);

	//CORNERS
	//TOP LEFT
	draw_sprite_part(_sprite, _index, 0, 0, _size, _size, _x1, _y1);
	//TOP RIGHT
	draw_sprite_part(_sprite, _index, _size * 2, 0, _size, _size, _x1 + _w - _size, _y1);
	//BOTTOM LEFT
	draw_sprite_part(_sprite, _index, 0, _size * 2, _size, _size, _x1, _y1 + _h - _size);
	//BOTTOM RIGHT
	draw_sprite_part(_sprite, _index, _size * 2, _size * 2, _size, _size, _x1 + _w - _size, _y1 + _h - _size);

	//EDGES
	//LEFT
	draw_sprite_part_ext(_sprite, _index, 0, _size, _size, 1, _x1, _y1 + _size, 1, _h - (_size * 2), c_white, 1);
	//RIGHT
	draw_sprite_part_ext(_sprite, _index, _size * 2, _size, _size, 1, _x1 + _w - _size, _y1 + _size, 1, _h - (_size * 2), c_white, 1);
	//TOP
	draw_sprite_part_ext(_sprite, _index, _size, 0, 1, _size, _x1 + _size, _y1, _w - (_size * 2), 1, c_white, 1);
	//BOTTOM
	draw_sprite_part_ext(_sprite, _index, _size, _size * 2, 1, _size, _x1 + _size, _y1 + _h - (_size), _w - (_size * 2), 1, c_white,1);
}

function calc_attack(_hitboxMask) {
	//Use attack hitbox and check for hits
	mask_index = _hitboxMask;
	var hitByAttackNow = ds_list_create();
	var hits = instance_place_list(x,y,par_enemy,hitByAttackNow,false);
	if hits > 0
	{
		for (var i = 0; i < hits; i++)
		{
			//If this instance has not yet been hit by this attack, hit it!
			var hitID = hitByAttackNow[| i];
			if (ds_list_find_index(hitByAttack, hitID) == -1)
			{
				ds_list_add(hitByAttack, hitID);
				with (hitID)
				{
					//image_blend = c_red;
					hitID.hp -= 1;
				}
			}
		}
	}
	ds_list_destroy(hitByAttackNow);
	mask_index = spr_cralkenIdle;
}

function move_world_bg(_layerX, _layerX2) {
	var _layerID = layer_get_id("WorldMap");
	var _layerID2 = layer_get_id("WorldNames");
	/*var _layerXpos = -(288 * world);
	if _layerX < _layerXpos {
		var _amount = -6;
	} else {
		var _amount = 6;
	}*/
	layer_x(_layerID, approach(_layerX, -(288 * global.worldSel), 24));
	layer_x(_layerID2, approach(_layerX2, -(288 * global.worldSel), 24));
	
	//return _layerXpos;
}

function script_execute_array(argument0, argument1) {
	var _scr = argument0;
	var _args = argument1;
	switch (array_length(_args)) {
 
		case 1: return script_execute(_scr, _args[0]);
 
		case 2: return script_execute(_scr, _args[0], _args[1]);
 
		case 3: return script_execute(_scr, _args[0], _args[1], _args[2]);
 
		case 4: return script_execute(_scr, _args[0], _args[1], _args[2], _args[3]);
 
		case 5: return script_execute(_scr, _args[0], _args[1], _args[2], _args[3], _args[4]);
 
		case 6: return script_execute(_scr, _args[0], _args[1], _args[2], _args[3], _args[4], _args[5]);
 
		case 7: return script_execute(_scr, _args[0], _args[1], _args[2], _args[3], _args[4], _args[5], _args[6]);
 
		case 8: return script_execute(_scr, _args[0], _args[1], _args[2], _args[3], _args[4], _args[5], _args[6], _args[7]);
 
		default: show_error("script_execute_array: argument count not supported!", false);
	}
}

function new_textbox() {

	var _obj;
	if instance_exists(obj_text) _obj = obj_textQueued; else _obj = obj_text;
	with instance_create_layer(0,0,"Instances",_obj)
	{
		message = argument[0];
		if (instance_exists(other)) originInstance = other.id; else originInstance = noone;
		if (argument_count > 1) background = argument[1]; else background = 0;
	}

	with obj_player
	{
		if state != player_state_locked
		{
			lastState = state;
			state = player_state_locked;
		}
	}


}
