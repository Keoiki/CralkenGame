lerpProgress += (1 - lerpProgress) / 50;
textProgress += global.textSpeed;

x1 = lerp(x1, x3, lerpProgress);
x2 = lerp(x2, x4, lerpProgress);

var _msgLength = string_length(message);

if (keyboard_check_pressed(vk_space)) {
	if textProgress >= _msgLength {
		instance_destroy();
		if instance_exists(obj_textQueued)
		{
			with obj_textQueued ticket--;
		}
		else
		{
			with obj_player state = lastState;
		}
	}
	if textProgress > 2 {
		textProgress = _msgLength;
	}
}

/*

var i = 0;

var _marker = string_pos("*", _print);

if string_copy(_print, i, _marker - 1) = _marker {
	istop = 1;
	timer0 = room_speed;
	_print = string_delete(_print, i, _marker);
}

if timer0 < 0 {
	timer0 -= 1;
} else {
	istop = 0;
}

if istop = 0 {
	i += 0.5;
}