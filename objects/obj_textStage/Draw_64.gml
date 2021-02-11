/// @desc Draw Text

//	nine_slice_box_stretched(spr_textbox, x1, y1, x2, y2, background);

draw_set_font(fntGUI);
draw_set_halign(fa_center);
draw_set_valign(fa_top);
var _print = string_copy(global.stageName, 1, textProgress);

draw_set_color($1C1C1C);
draw_text((x1 + x2) / 2 - 1, y1 - 1, _print);
draw_text((x1 + x2) / 2 - 1, y1 + 1, _print);
draw_text((x1 + x2) / 2 + 1, y1 - 1, _print);
draw_text((x1 + x2) / 2 + 1, y1 + 1, _print);
draw_set_color(c_black);
draw_text((x1 + x2) / 2 - 1, y1, _print);
draw_text((x1 + x2) / 2 + 1, y1, _print);
draw_text((x1 + x2) / 2, y1 - 1, _print);
draw_text((x1 + x2) / 2, y1 + 1, _print);
draw_set_color(c_white);
draw_text((x1 + x2) / 2, y1, _print);
draw_set_halign(fa_left);