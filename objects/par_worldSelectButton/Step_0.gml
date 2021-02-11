if (mouse_check_button_pressed(mb_left))
{
	if (point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), bbox_left, bbox_top, bbox_right, bbox_bottom)) && !global.movement
	{
		if global.worldSel != world
		{
			global.worldSel = world;
			audio_play_sound(snd_buttonPress, 20, false);
		}
		global.movement = true;
	}
}

if global.worldSel = world
{
	image_index = world + 7;
} else image_index = world;