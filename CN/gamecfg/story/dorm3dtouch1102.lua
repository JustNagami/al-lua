return {
	hideRecord = true,
	dialogbox = 2,
	mode = 2,
	alpha = 0,
	id = "DORM3DTOUCH1102",
	hideSkip = true,
	hideAuto = true,
	scripts = {
		{
			actorName = "天狼星",
			nameColor = "#FFFFFF",
			say = "主人，是对天狼星的服饰感兴趣吗？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			dispatcher = {
				name = STORY_EVENT.TEST,
				data = {
					op_list = {
						{
							skip = true,
							name = "zhan_hudong_jianbang",
							type = "action"
						},
						{
							param = "Play",
							name = "Face_danxin",
							time = 0,
							type = "action",
							skip = true
						},
						{
							skip = false,
							time = 2,
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
