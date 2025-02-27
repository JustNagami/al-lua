return {
	id = "FANLONGNEIDESHENGUANG8",
	mode = 2,
	fadeOut = 1.5,
	scripts = {
		{
			stopbgm = true,
			mode = 1,
			asideType = 3,
			blackBg = true,
			say = "？？？·？？？",
			sequence = {
				{
					"？？？·？？？",
					1
				},
				{
					"？？？？",
					2
				}
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "star_level_bg_499",
			hidePaintObj = true,
			say = "再次从门中返回后，远方空间中的那个纯白的轮廓，似乎变得更加凝实了一些。",
			bgm = "theme-underheaven",
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
			actor = 0,
			nameColor = "#A9F548FF",
			bgName = "star_level_bg_499",
			hidePaintObj = true,
			side = 2,
			portrait = "zhihuiguan",
			say = "（ProjectH……代号为H的人工智能么。）",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "star_level_bg_505",
			hidePaintObj = true,
			say = "就在心中产生了些许联想之时，道路前方又出现了一扇门。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			flashout = {
				black = false,
				dur = 0.5,
				alpha = {
					0,
					1
				}
			},
			flashin = {
				delay = 0.5,
				dur = 0.5,
				black = false,
				alpha = {
					1,
					0
				}
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "star_level_bg_505",
			hidePaintObj = true,
			say = "伸手触碰门扉之后，眼前的世界随即改变——",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			oldPhoto = true,
			side = 2,
			bgName = "star_level_bg_595",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			say = "银白色的海面上，悬浮着一支快速前进的舰队。",
			bgm = "battle-thehierophantv",
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
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 900465,
			nameColor = "#A9F548FF",
			bgName = "star_level_bg_595",
			hidePaintObj = true,
			side = 2,
			actorName = "ProjectM",
			oldPhoto = true,
			say = "海洛芬特，我们即将在三分钟后抵达求救信号发出的区域。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 4,
			side = 2,
			bgName = "star_level_bg_595",
			oldPhoto = true,
			actorName = "ProjectM",
			actor = 900465,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "目前，尚未检测到任何存活生命体。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 900465,
			nameColor = "#A9F548FF",
			bgName = "star_level_bg_595",
			hidePaintObj = true,
			side = 2,
			actorName = "ProjectM",
			oldPhoto = true,
			say = "嗯，我知道，干扰过于严重，检测结果并不可靠。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			side = 2,
			nameColor = "#A9F548FF",
			bgName = "star_level_bg_595",
			hidePaintObj = true,
			oldPhoto = true,
			say = "轰——————！",
			soundeffect = "event:/battle/boom2",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			flashN = {
				color = {
					1,
					1,
					1,
					1
				},
				alpha = {
					{
						0,
						1,
						0.2,
						0
					},
					{
						1,
						0,
						0.2,
						0.2
					},
					{
						0,
						1,
						0.2,
						0.4
					},
					{
						1,
						0,
						0.2,
						0.6
					}
				}
			},
			dialogShake = {
				speed = 0.09,
				x = 8.5,
				number = 2
			}
		},
		{
			expression = 4,
			side = 2,
			bgName = "star_level_bg_595",
			oldPhoto = true,
			actorName = "ProjectM",
			actor = 900465,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "警告，求救区域发现拟态兽舰队，似有伏击意图。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 2,
			side = 2,
			bgName = "star_level_bg_595",
			oldPhoto = true,
			actorName = "ProjectM",
			actor = 900465,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "警告，全舰系统正在遭受拟态兽干扰，此处确实是陷阱。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 4,
			side = 2,
			bgName = "star_level_bg_595",
			oldPhoto = true,
			actorName = "ProjectM",
			actor = 900465,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "已确认实验型「裁决之杖」使用状态。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 900465,
			nameColor = "#A9F548FF",
			bgName = "star_level_bg_595",
			hidePaintObj = true,
			side = 2,
			actorName = "ProjectM",
			oldPhoto = true,
			say = "海洛芬特，确认干扰正在减弱。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 4,
			side = 2,
			bgName = "star_level_bg_595",
			oldPhoto = true,
			actorName = "ProjectM",
			actor = 900465,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "——嗯，同时确认干扰源已经消失。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 2,
			side = 2,
			bgName = "star_level_bg_595",
			oldPhoto = true,
			actorName = "ProjectM",
			actor = 900465,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "本次实验型「裁决之杖」使用结束，数据已归档，通古斯陨石样本状态无异常。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 900465,
			nameColor = "#A9F548FF",
			bgName = "star_level_bg_595",
			hidePaintObj = true,
			side = 2,
			actorName = "ProjectM",
			oldPhoto = true,
			say = "已确认实验型「裁决之杖」使用状态。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 2,
			side = 2,
			bgName = "star_level_bg_595",
			oldPhoto = true,
			actorName = "ProjectM",
			actor = 900465,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "瓦解特征：纯白，观测成功。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 4,
			side = 2,
			bgName = "star_level_bg_595",
			oldPhoto = true,
			actorName = "ProjectM",
			actor = 900465,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "已确认打击效果，空中与水面的X附着区正在瓦解。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 1,
			side = 2,
			bgName = "star_level_bg_595",
			oldPhoto = true,
			actorName = "ProjectM",
			actor = 900465,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "本次实验型「裁决之杖」使用结束，数据已归档，通古斯陨石样本状态无异常。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 900465,
			nameColor = "#A9F548FF",
			bgName = "star_level_bg_595",
			hidePaintObj = true,
			side = 2,
			actorName = "ProjectM",
			oldPhoto = true,
			say = "海洛芬特，下一处行动的坐标发来了，正在调整航线——",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
