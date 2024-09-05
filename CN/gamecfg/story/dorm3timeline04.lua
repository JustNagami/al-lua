return {
	hideRecord = true,
	dialogbox = 2,
	mode = 2,
	alpha = 0,
	id = "DORM3TIMELINE04",
	hideSkip = true,
	hideAuto = true,
	scripts = {
		{
			bgm = "theme-room-rosy",
			stopbgm = true,
			dispatcher = {
				nextOne = true,
				name = STORY_EVENT.TEST,
				data = {
					op_list = {
						{
							sceneRoot = "Common/Bathroom",
							name = "Tianlangxing04_Yushicahan",
							time = 0,
							type = "timeline",
							skip = false,
							scene = "map_bathroom_01",
							options = {
								{
									{
										content = "咳、不用了……"
									},
									{
										content = "还是先坐下吧……"
									}
								},
								{
									{
										content = "不舒服吗？"
									}
								},
								{
									{
										content = "没关系"
									},
									{
										content = "我并不介意"
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
								},
								{
									{
										pos = {
											0,
											0
										}
									}
								},
								{
									{
										pos = {
											0,
											0
										}
									}
								},
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
