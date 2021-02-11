/*

var _layerID = layer_get_id("WorldMap");
var _layerX = layer_get_x(_layerID);
var _layerID2 = layer_get_id("WorldNames");
var _layerX2 = layer_get_x(_layerID2);

draw_set_font(fntGUI);

draw_text(8, 8, global.worldSel);
draw_text(8, 16, _layerX);
draw_text(8, 24, global.destination);
draw_text(8, 32, _layerX2);