return {
	hideRecord = true,
	dialogbox = 2,
	mode = 2,
	id = "DORM3TIMELINE11005",
	alpha = 0,
	hideSkip = true,
	hideAuto = true,
	placeholder = {
		"dorm3d"
	},
	scripts = {
		{
			bgm = "Story-room-newjersey",
			stopbgm = true,
			dispatcher = {
				nextOne = true,
				name = STORY_EVENT.TEST,
				data = {
					op_list = {
						{
							sceneRoot = "Xinzexi_DB/Newjerseyhostel",
							name = "FFliwu_10517_02",
							scene = "map_newjerseyhostel_01",
							type = "timeline",
							skip = false,
							options = {
								{
									{
										content = "面白い。中々頭を捻る必要がある"
									}
								},
								{
									{
										content = "戦い方はもう見切った"
									}
								},
								{
									{
										content = "ちょっとあまりフェアじゃないな"
									}
								},
								{
									{
										content = "引き分けならなんとか…！"
									}
								}
							},
							touchs = {
								{
									{
										pos = {
											0,
											0
										}
									}
								}
							}
						}
					}
				},
				callbackData = {
					hideUI = true,
					name = STORY_EVENT.TEST_DONE
				}
			}
		}
	}
}
