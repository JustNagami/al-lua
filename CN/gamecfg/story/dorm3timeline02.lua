return {
	hideRecord = true,
	dialogbox = 2,
	mode = 2,
	alpha = 0,
	id = "DORM3TIMELINE02",
	hideSkip = true,
	hideAuto = true,
	scripts = {
		{
			bgm = "story-room-sirius",
			stopbgm = true,
			dispatcher = {
				nextOne = true,
				name = STORY_EVENT.TEST,
				data = {
					op_list = {
						{
							sceneRoot = "Tianlangxing_DB/DormitoryCorridor",
							name = "Tianlangxing02_Zoulangdengdai",
							time = 0,
							type = "timeline",
							skip = false,
							scene = "map_dormitorycorridor_01",
							options = {
								{
									{
										content = "在看风景？"
									},
									{
										content = "在发呆？"
									}
								},
								{
									{
										content = "天狼星这样也很好"
									},
									{
										content = "不用像平时那样，偶尔放松一下也好"
									}
								},
								{
									{
										content = "另一方面？"
									}
								}
							},
							touchs = {
								{
									{
										pos = {
											100,
											-150
										}
									}
								},
								{
									{
										pos = {
											80,
											200
										}
									}
								},
								{
									{
										pos = {
											400,
											-50
										}
									}
								},
								{
									{
										pos = {
											100,
											200
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
