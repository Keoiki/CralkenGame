if global.stageData[_id] != 0 {
	switch (_id) {
		case 0: {
			global.stageName = "Stage 1:\nThe Wind's Echo";
			break;
		}
		case 1: {
			global.stageName = "Stage 2:\nWindmill Spotting";
			break;
		}
		case 2: {
			global.stageName = "Stage 3:\nBarjumping";
			break;
		}
		case 3: {
			global.stageName = "Stage 4:\Climbing the Hillside";
			break;
		}
		case 4: {
			global.stageName = "Stage 5:\Spikecopter Airspace";
			break;
		}
		case 5: {
			global.stageName = "Stage 6:\Atop the Highest Waterfall";
			break;
		}
		case 6: {
			global.stageName = "Stage 7:\nThe Adventure Begins";
			break;
		}
		default: {
			global.stageName = "No Stage Name :(";
			break;
		}
	}
}
instance_create_layer(136, 120, "Instances", obj_textStage);