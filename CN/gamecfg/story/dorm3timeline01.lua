return {
	hideRecord = true,
	dialogbox = 2,
	mode = 2,
	alpha = 0,
	id = "DORM3TIMELINE01",
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
							skip = false,
							name = "Tianlangxing01_Jinmenjieshao",
							time = 0,
							type = "timeline",
							options = {
								{
									{
										content = "没关系"
									}
								},
								{
									{
										content = "把房间打扫得这么整洁，一定很辛苦吧？"
									}
								},
								{
									{
										content = "万全准备？"
									},
									{
										content = "都做了什么准备？"
									}
								},
								{
									{
										content = "先好好休息一下吧"
									}
								},
								{
									{
										content = "不是那个意思……"
									},
									{
										content = "你误会了……"
									}
								}
							},
							touchs = {
								{
									{
										pos = {
											0,
											50
										}
									}
								},
								{
									{
										pos = {
											0,
											50
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
