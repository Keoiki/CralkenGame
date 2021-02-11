/// @description
view_width = 288;
view_height = 162;

window_scale = 6;

window_set_size(view_width * window_scale, view_height * window_scale);
alarm[0] = 1;

surface_resize(application_surface, view_width * window_scale, view_height * window_scale);
display_set_gui_size(resW, resH);