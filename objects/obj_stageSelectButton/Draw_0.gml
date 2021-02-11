if global.stageData[_id] = 0 {
	shader_set(shd_bw);
	draw_self();
	shader_reset();
} else {
	draw_self();
}