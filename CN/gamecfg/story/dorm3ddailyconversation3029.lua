return {
	fadeOut = 1.5,
	dialogbox = 2,
	hideRecord = true,
	mode = 2,
	alpha = 0,
	id = "DORM3DDAILYCONVERSATION3029",
	hideSkip = true,
	hideAuto = true,
	placeholder = {
		"dorm3d"
	},
	scripts = {
		{
			side = 2,
			actorName = 19903,
			nameColor = "#FFFFFF",
			hidePaintObj = true,
			dir = 1,
			say = "呼呼……呼呼……好累……啊！{dorm3d}！",
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
							name = "ab_shuohua_idle_01",
							time = 0,
							type = "action",
							skip = true
						},
						{
							skip = true,
							name = "Face_weixiao",
							type = "action"
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
		},
		{
			side = 2,
			actorName = 19903,
			nameColor = "#FFFFFF",
			hidePaintObj = true,
			dir = 1,
			say = "安克雷奇，今天吹气球！很努力，但吹不大……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			side = 2,
			actorName = 19903,
			nameColor = "#FFFFFF",
			hidePaintObj = true,
			dir = 1,
			say = "吹起来，一会儿，变小！再吹起来，还是，变小！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			side = 2,
			actorName = 19903,
			nameColor = "#FFFFFF",
			hidePaintObj = true,
			dir = 1,
			say = "唔，好难……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			options = {
				{
					content = "是忘了扎起来？",
					flag = 1
				},
				{
					content = "是漏气了？",
					flag = 1
				}
			},
			dispatcher = {
				name = STORY_EVENT.TEST,
				data = {
					op_list = {
						{
							param = "Play",
							name = "ab_shuohua_gandong_01",
							time = 0,
							type = "action",
							skip = true
						},
						{
							skip = true,
							name = "Face_kaixin",
							type = "action"
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
		},
		{
			side = 2,
			actorName = 19903,
			nameColor = "#FFFFFF",
			hidePaintObj = true,
			dir = 1,
			say = "不知道……安克雷奇玩累了……！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			side = 2,
			actorName = 19903,
			nameColor = "#FFFFFF",
			hidePaintObj = true,
			dir = 1,
			say = "和{dorm3d}一起……接下来一整天！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
