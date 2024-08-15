return {
	id = "TIEYIQINGFENG24-1",
	mode = 2,
	fadeOut = 1.5,
	scripts = {
		{
			actor = 900011,
			nameColor = "#FF9B93",
			bgName = "star_level_bg_504",
			hidePaintObj = true,
			actorName = "测试者",
			side = 2,
			say = "——通告：东煌舰队，你们正在进行严重的越界行为。",
			bgm = "battle-donghuang-static",
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
			actor = 900011,
			nameColor = "#FF9B93",
			bgName = "star_level_bg_504",
			hidePaintObj = true,
			side = 2,
			actorName = "测试者",
			say = "就此退回沿海区域，等待大风暴系统的重新启动，我将不会进行追击。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 900011,
			nameColor = "#FF9B93",
			bgName = "star_level_bg_504",
			hidePaintObj = true,
			side = 2,
			actorName = "测试者",
			say = "否则，等待着你们的只有全军覆没的结局。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 599010,
			side = 2,
			bgName = "star_level_bg_504",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			say = "不让我们突破，那意思就是让我们乖乖的被风暴困上一辈子？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 501030,
			side = 2,
			bgName = "star_level_bg_504",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			say = "痴心妄想，白日做梦~！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			action = {
				{
					type = "shake",
					y = 0,
					delay = 0,
					dur = 0.4,
					x = 30,
					number = 2
				}
			}
		},
		{
			actor = 501040,
			side = 2,
			bgName = "star_level_bg_504",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			say = "我看你是抵挡不住了，所以才出来和我们聊天拖延时间的吧。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 501020,
			side = 2,
			bgName = "star_level_bg_504",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			say = "没错没错，就是就是！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			action = {
				{
					type = "shake",
					y = 0,
					delay = 0,
					dur = 0.4,
					x = 30,
					number = 2
				}
			},
			options = {
				{
					content = "多说无益——",
					flag = 1
				},
				{
					content = "原话奉还——",
					flag = 2
				},
				{
					content = "全军覆没——？",
					flag = 3
				}
			}
		},
		{
			actor = 0,
			side = 2,
			bgName = "star_level_bg_504",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			optionFlag = 1,
			say = "在实验场β中，我们的冲突是不可调和的，多说无益。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 501010,
			side = 2,
			bgName = "star_level_bg_504",
			hidePaintObj = true,
			dir = 1,
			optionFlag = 1,
			nameColor = "#A9F548FF",
			say = "要战便战，要降便降，我军优待俘虏。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			side = 2,
			bgName = "star_level_bg_504",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			optionFlag = 2,
			say = "我在这里对你原话奉还，将马里亚纳要塞群拱手相让的话，我可以考虑不继续追击你。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 502090,
			side = 2,
			bgName = "star_level_bg_504",
			hidePaintObj = true,
			dir = 1,
			optionFlag = 2,
			nameColor = "#A9F548FF",
			say = "姐姐劝你乖乖听话比较好哟~",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			side = 2,
			bgName = "star_level_bg_504",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			optionFlag = 3,
			say = "我作为碧蓝航线的指挥官，从PH港战役开始一路征战至今，还没有见到能让我全军覆没的人呢。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			side = 2,
			bgName = "star_level_bg_504",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			optionFlag = 3,
			say = "你也不会例外。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 900011,
			nameColor = "#FF9B93",
			bgName = "star_level_bg_504",
			hidePaintObj = true,
			side = 2,
			actorName = "测试者",
			say = "——量产型IV型舰队，迎敌。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
