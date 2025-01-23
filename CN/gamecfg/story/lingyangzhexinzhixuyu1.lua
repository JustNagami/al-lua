return {
	fadeOut = 1.5,
	mode = 2,
	defaultTb = 2200,
	id = "LINGYANGZHEXINZHIXUYU1",
	placeholder = {
		"tb"
	},
	scripts = {
		{
			expression = 6,
			side = 2,
			bgName = "bg_project_oceana_room3",
			actor = -2,
			actorName = "娜比娅",
			bgm = "qe-ova-4",
			dynamicBgType = -2,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "{tb}~看在你最近还算努力的份上，我准备了这个特调果汁哦~",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			flashout = {
				black = true,
				dur = 1,
				alpha = {
					0,
					1
				}
			},
			flashin = {
				delay = 1,
				dur = 1,
				black = true,
				alpha = {
					1,
					0
				}
			}
		},
		{
			expression = 6,
			side = 2,
			bgName = "bg_project_oceana_room3",
			actor = -2,
			actorName = "娜比娅",
			dynamicBgType = -2,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "虽然颜色有点奇怪……但是味道肯定很不错！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 8,
			side = 2,
			bgName = "bg_project_oceana_room3",
			actor = -2,
			actorName = "娜比娅",
			dynamicBgType = -2,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "是人家自己调制的独家配方哦♪",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 8,
			side = 2,
			bgName = "bg_project_oceana_room3",
			actor = -2,
			actorName = "娜比娅",
			dynamicBgType = -2,
			nameColor = "#A9F548FF",
			important = true,
			hidePaintObj = true,
			say = "要不要来一口？保证你终身难忘哦~",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			options = {
				{
					flag = 1,
					content = "我觉得普通果汁就挺好的",
					type = 1
				},
				{
					flag = 2,
					content = "正好渴了，我全部喝掉！",
					type = 2
				}
			}
		},
		{
			expression = 4,
			side = 2,
			bgName = "bg_project_oceana_room3",
			actor = -2,
			actorName = "娜比娅",
			optionFlag = 1,
			dynamicBgType = -2,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "欸……{tb}真无趣。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 7,
			side = 2,
			bgName = "bg_project_oceana_room3",
			actor = -2,
			actorName = "娜比娅",
			optionFlag = 2,
			dynamicBgType = -2,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "哎呀~看来今天会很有意思呢♪",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
