return {
	fadeOut = 1.5,
	dialogbox = 2,
	hideRecord = true,
	mode = 2,
	alpha = 0,
	id = "DORM3DHELLOACCOMPANY6",
	hideSkip = true,
	hideAuto = true,
	scripts = {
		{
			side = 2,
			actorName = "天狼星",
			nameColor = "#FFFFFF",
			hidePaintObj = true,
			dir = 1,
			say = "主人，要过来一起坐一会吗？\n天狼星还为您准备了点心和红茶哦。",
			voice = "event:/dorm/Tianlangxing_dorm3d_tone1/drom3d_sirus_wait_table1",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			dispatcher = {
				name = STORY_EVENT.TEST,
				data = {
					op_list = {
						{
							param = "Play",
							name = "biaoda",
							time = 0,
							type = "action",
							skip = true
						},
						{
							skip = false,
							time = 1.5,
							type = "wait"
						}
					}
				},
				callbackData = {
					hideUI = false,
					name = STORY_EVENT.TEST_DONE
				}
			}
		}
	}
}
