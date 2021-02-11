if (mouse_check_button_pressed(mb_left)) {
	if (point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), bbox_left, bbox_top, bbox_right, bbox_bottom)) {
		switch (global.worldSel) {
		    case 0: room_goto(rm_stageSelect01); break;
		    case 1: room_goto(rm_stageSelect02); break;
		}
		audio_play_sound(snd_playButtonPress, 20, false);
	}
}