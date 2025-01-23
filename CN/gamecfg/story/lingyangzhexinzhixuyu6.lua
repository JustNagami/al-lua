return {
	fadeOut = 1.5,
	mode = 2,
	defaultTb = 2002,
	id = "LINGYANGZHEXINZHIXUYU6",
	placeholder = {
		"tb"
	},
	scripts = {
		{
			expression = 3,
			side = 2,
			bgName = "bg_project_oceana_room2",
			actor = -2,
			actorName = "娜比娅",
			bgm = "qe-ova-3",
			dynamicBgType = -2,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "衣柜好乱哦……",
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
			expression = 5,
			side = 2,
			bgName = "bg_project_oceana_room2",
			actor = -2,
			actorName = "娜比娅",
			dynamicBgType = -2,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "但是自己整理起来又没有头绪……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 3,
			side = 2,
			bgName = "bg_project_oceana_room2",
			actor = -2,
			actorName = "娜比娅",
			dynamicBgType = -2,
			nameColor = "#A9F548FF",
			important = true,
			hidePaintObj = true,
			say = "{tb}觉得怎么整理会比较好呢？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			options = {
				{
					flag = 1,
					content = "按照类型分类放好吧",
					type = 1
				},
				{
					flag = 2,
					content = "随便塞一塞就好啦",
					type = 2
				}
			}
		},
		{
			actor = -2,
			side = 2,
			bgName = "bg_project_oceana_room2",
			actorName = "娜比娅",
			optionFlag = 1,
			dynamicBgType = -2,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "说的也是呢。这样整理的话以后会更方便找……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 6,
			side = 2,
			bgName = "bg_project_oceana_room2",
			actor = -2,
			actorName = "娜比娅",
			optionFlag = 1,
			dynamicBgType = -2,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "以后我也要保持这样的习惯，让{tb}放心才好~",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = -2,
			side = 2,
			bgName = "bg_project_oceana_room2",
			actorName = "娜比娅",
			optionFlag = 2,
			dynamicBgType = -2,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "{tb}这么说……我感觉简单了很多呢。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 8,
			side = 2,
			bgName = "bg_project_oceana_room2",
			actor = -2,
			actorName = "娜比娅",
			optionFlag = 2,
			dynamicBgType = -2,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "下次找衣服的时候应该会很有趣吧……就像寻宝一样。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
