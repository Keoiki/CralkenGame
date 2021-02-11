global.destination = -(288 * global.worldSel);
if global.worldSel < 0 {
	global.worldSel = 6;
}
if global.worldSel > 6 {
	global.worldSel = 0;
}

if room = rm_worldSelect {
	var _layerID = layer_get_id("WorldMap");
	var _layerX = layer_get_x(_layerID);
	var _layerID2 = layer_get_id("WorldNames");
	var _layerX2 = layer_get_x(_layerID2);
	if global.movement {
	    move_world_bg(_layerX, _layerX2);
	}
	if _layerX = global.destination {
	    global.movement = false;
	}
	layer_y(_layerID2, obj_wave(0, 3, 6, 0));
}

