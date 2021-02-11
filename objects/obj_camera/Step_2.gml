/// @description
#macro view view_camera[0]
camera_set_view_size(view, view_width, view_height);

if instance_exists(obj_player) {
	var _x = clamp(obj_player.x - view_width / 2, 0, room_width - view_width);
	var _y = clamp(obj_player.y - view_height / 2, 0, room_height - view_height);
	
	var _curX = camera_get_view_x(view);
	var _curY = camera_get_view_y(view);
	
	var _spd = .1;
	camera_set_view_pos(view,
						lerp(_curX, _x, _spd),
						lerp(_curY, _y, _spd));
}