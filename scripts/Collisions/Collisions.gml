// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function collisions_block(hsp, vsp) {
	if (place_meeting(x + hsp, y, obj_block))
	{
		while (!place_meeting(x + sign(hsp), y, obj_block))
		{
			x = x + sign(hsp);
		}
		hsp = 0;
	}
	
	x += hsp;
	
	if (place_meeting(x, y + vsp, obj_block))
	{
		while (!place_meeting(x ,y + sign(vsp), obj_block))
		{
			y = y + sign(vsp);
		}
		vsp = 0;
	}
	
	y += vsp;
}

function collisions() {
	if (place_meeting(x + hsp, y, obj_block))
	{
		while (!place_meeting(x + sign(hsp), y, obj_block))
		{
			x = x + sign(hsp);
		}
		hsp = 0;
	}
	
	x += hsp;
	
	if (place_meeting(x, y + vsp, obj_block))
	{
		while (!place_meeting(x ,y + sign(vsp), obj_block))
		{
			y = y + sign(vsp);
		}
		vsp = 0;
	}

	//Platform Collision - Top only!
	var playerObject = event_object;
	if playerObject = obj_player
	{
		if (place_meeting(x,y+(vsp*2),obj_platform))
		{
			while (!place_meeting(x,y+1,obj_platform))
			{
				y = y + sign(vsp*2);
			}
			vsp = 0;
		}
	}
	
	y += vsp;
}