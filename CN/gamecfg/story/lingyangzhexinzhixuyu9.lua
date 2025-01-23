return {
	fadeOut = 1.5,
	mode = 2,
	defaultTb = 2100,
	id = "LINGYANGZHEXINZHIXUYU9",
	placeholder = {
		"tb"
	},
	scripts = {
		{
			actor = -2,
			side = 2,
			bgName = "bg_project_oceana_room3",
			actorName = "娜比娅",
			bgm = "qe-ova-3",
			dynamicBgType = -2,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "我今天看了一个纸雕的制作教程，好想试试看哦。",
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
			expression = 2,
			side = 2,
			bgName = "bg_project_oceana_room3",
			actor = -2,
			actorName = "娜比娅",
			dynamicBgType = -2,
			nameColor = "#A9F548FF",
			important = true,
			hidePaintObj = true,
			say = "不过层次稍微有点复杂呢……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			options = {
				{
					flag = 1,
					content = "我们按照教程慢慢来吧？",
					type = 1
				},
				{
					flag = 2,
					content = "不如自己设计新样式？",
					type = 2
				}
			}
		},
		{
			actor = -2,
			side = 2,
			bgName = "bg_project_oceana_room3",
			actorName = "娜比娅",
			optionFlag = 1,
			dynamicBgType = -2,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "好呀，跟着教程耐心地做应该不会有问题。",
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
			optionFlag = 1,
			dynamicBgType = -2,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "而且还有{tb}陪着我一起做，那我就更放心啦~",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 6,
			side = 2,
			bgName = "bg_project_oceana_room3",
			actor = -2,
			actorName = "娜比娅",
			optionFlag = 2,
			dynamicBgType = -2,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "自己设计的话……也不是不行呢。",
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
			optionFlag = 2,
			dynamicBgType = -2,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "也许能做出最特别的纸雕送给{tb}……想想就很期待呢。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
