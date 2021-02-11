if (mouse_check_button_pressed(mb_left)) {
	if (point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), bbox_left, bbox_top, bbox_right, bbox_bottom)) {
		switch (room) {
		    case rm_worldSelect: game_end(); break;
		    case rm_stageSelect01: room_goto(rm_worldSelect); break;
		    case rm_stageSelect02: room_goto(rm_worldSelect); break;
		}
	}
}