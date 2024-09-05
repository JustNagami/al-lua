return {
	fadeOut = 1.5,
	dialogbox = 2,
	hideRecord = true,
	mode = 2,
	alpha = 0,
	id = "DORM3DDAILYCONVERSATION37",
	hideSkip = true,
	hideAuto = true,
	scripts = {
		{
			side = 2,
			actorName = "天狼星",
			nameColor = "#FFFFFF",
			hidePaintObj = true,
			dir = 1,
			say = "哼哼♪~",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			options = {
				{
					content = "遇到了好事吗？",
					flag = 1
				}
			},
			dispatcher = {
				name = STORY_EVENT.TEST,
				data = {
					op_list = {
						{
							param = "Play",
							name = "jidong",
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
		},
		{
			side = 2,
			actorName = "天狼星",
			nameColor = "#FFFFFF",
			hidePaintObj = true,
			dir = 1,
			say = "是的，因为和我骄傲的主人独处一室，实在是令天狼星心潮澎湃，接下来的时间，不如就……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			side = 2,
			actorName = "天狼星",
			nameColor = "#FFFFFF",
			hidePaintObj = true,
			dir = 1,
			say = "欸？难道您还没有这方面的想法吗？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
