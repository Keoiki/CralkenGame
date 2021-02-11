lerpProgress += (1 - lerpProgress) / 50;
textProgress += 1.25;

x1 = lerp(x1, x3, lerpProgress);
x2 = lerp(x2, x4, lerpProgress);

var _msgLength = string_length(global.stageName);

if (keyboard_check_pressed(vk_space)) {
	if textProgress >= _msgLength {
		instance_destroy();
	}
	if textProgress > 2 {
		textProgress = _msgLength;
	}
}