return {
	hideRecord = true,
	dialogbox = 2,
	mode = 2,
	id = "DORM3DGIFTFEEDBACK205",
	alpha = 0,
	hideSkip = true,
	hideAuto = true,
	placeholder = {
		"dorm3d"
	},
	scripts = {
		{
			actorName = 30221,
			nameColor = "#FFFFFF",
			say = "呵呵，会想到送我这个，{dorm3d}一定认真挑选了很久吧？",
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
							name = "shuohua_gandong",
							type = "action"
						},
						{
							skip = true,
							name = "Face_kaixing",
							type = "action"
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
		},
		{
			actorName = 30221,
			nameColor = "#FFFFFF",
			say = "不过光是关心我可不行，{dorm3d}自己也要注意劳逸结合哦？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
