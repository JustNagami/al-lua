return {
	fadeOut = 1.5,
	mode = 2,
	id = "XINGGUANGXIADEYUHUI12-1",
	placeholder = {
		"playername"
	},
	scripts = {
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "star_level_bg_596",
			hidePaintObj = true,
			say = "此刻，舰队正以直线距离向基地方向全速行驶着。",
			bgm = "story-ironblood-strong",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			location = {
				"ID-AX-98号海域",
				3
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
			bgName = "star_level_bg_596",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 402110,
			say = "鲁梅女士，指挥官，如果继续直线行驶的话，舰队将会驶入高危海域中。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			nameColor = "#A9F548FF",
			bgName = "star_level_bg_596",
			hidePaintObj = true,
			side = 2,
			portrait = "zhihuiguan",
			say = "（……高危海域？）",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			nameColor = "#A9F548FF",
			bgName = "star_level_bg_596",
			hidePaintObj = true,
			side = 2,
			portrait = "zhihuiguan",
			say = "高危海域对于我们主力舰队的危险程度如何？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 2,
			side = 2,
			bgName = "star_level_bg_596",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 407040,
			say = "有一定威胁，但是能应对。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 6,
			side = 2,
			bgName = "star_level_bg_596",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 402110,
			say = "那我们接下来……？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 4,
			side = 2,
			bgName = "star_level_bg_596",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 407040,
			say = "情况危急，我们必须尽快赶回去……航线不变。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 2,
			side = 2,
			bgName = "star_level_bg_596",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 402110,
			say = "……是！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
