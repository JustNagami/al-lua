return {
	hideRecord = true,
	dialogbox = 2,
	mode = 2,
	alpha = 0,
	id = "DORM3DHELLO4",
	hideSkip = true,
	hideAuto = true,
	scripts = {
		{
			actorName = "天狼星",
			nameColor = "#FFFFFF",
			say = "贵安，我骄傲的主人，天狼星已经在这里恭候您多时了。不过……只要能够侍奉主人，天狼星无论付出多久的等待都是值得的。 ",
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
							name = "Bow",
							type = "action"
						},
						{
							param = "Play",
							name = "Face_weixiao",
							time = 0,
							type = "action",
							skip = true
						},
						{
							skip = false,
							time = 1,
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
