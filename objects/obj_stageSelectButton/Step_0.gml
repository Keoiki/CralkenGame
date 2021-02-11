if (mouse_check_button_pressed(mb_left))
{
	if (point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), bbox_left, bbox_top, bbox_right, bbox_bottom))
	{
		if _id = 0 {
			room_goto(_stage);
			audio_play_sound(snd_buttonPress, 20, false);
		} else if global.stageData[_id] = 1 {
			room_goto(_stage);
			audio_play_sound(snd_buttonPress, 20, false);
		}
	}
}