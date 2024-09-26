return {
	fadeOut = 1.5,
	dialogbox = 2,
	hideRecord = true,
	mode = 2,
	alpha = 0,
	id = "DORM3DHELLOACCOMPANYBEACH1",
	hideSkip = true,
	hideAuto = true,
	scripts = {
		{
			side = 2,
			actorName = "天狼星",
			nameColor = "#FFFFFF",
			hidePaintObj = true,
			dir = 1,
			say = "唔……主人……\n海水凉凉的，这样非常舒服哦……主人也想试试吗？",
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
							name = "shy",
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
