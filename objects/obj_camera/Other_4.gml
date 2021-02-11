/// @description 
view_enabled = true;
view_visible[0] = true;

if room = rm_worldSelect {
	var _layerID = layer_get_id("WorldMap");
	var _layerID2 = layer_get_id("WorldNames");
	layer_x(_layerID, -(288 * global.worldSel));
	layer_x(_layerID2, -(288 * global.worldSel));
}