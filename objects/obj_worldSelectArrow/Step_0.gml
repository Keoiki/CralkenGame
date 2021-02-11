if (mouse_check_button_pressed(mb_left)) {
	if (point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), bbox_left, bbox_top, bbox_right, bbox_bottom)) {
		if image_xscale = 1 {
			global.worldSel++;
		}
		if image_xscale = -1 {
			global.worldSel--;
		}
		global.movement = true;
		audio_play_sound(snd_buttonPress, 20, false);
	}
}

/*

if gamepad_button_check_pressed(0, gp_padl) {
	global.worldSel -= 0.5;
	global.movement = true;
		audio_play_sound(snd_buttonPress, 20, false);
}
if gamepad_button_check_pressed(0, gp_padr) {
	global.worldSel += 0.5;
	global.movement = true;
		audio_play_sound(snd_buttonPress, 20, false);
}