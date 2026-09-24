return {
	id = "YOUYINGMICHENG18-3",
	mode = 2,
	fadeOut = 1.5,
	scripts = {
		{
			side = 2,
			NextIcon = 1,
			bgName = "star_level_bg_148",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			say = "収容装置の輝きがライオンを捕らえたその瞬間、彼女は一瞬呆然とし、そして笑い始めた。",
			bgm = "story-visioncity-1",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 9,
			side = 2,
			bgName = "star_level_bg_148",
			factiontag = "妖異",
			dir = 1,
			NextIcon = 1,
			actor = 205162,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "負けを潔く認めよう……今回はお前たちの勝ちだ",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			asideType = 4,
			mode = 1,
			bgName = "bg_youyingmicheng_2",
			spacing = 30,
			flashout = {
				black = true,
				dur = 0.5,
				alpha = {
					0,
					1
				}
			},
			flashin = {
				delay = 0.5,
				dur = 0.5,
				black = true,
				alpha = {
					1,
					0
				}
			},
			rectMargin = {
				100,
				100,
				200,
				200
			},
			sequence = {
				{
					"<size=45>こうして、NO.3からNO.6までの都市と手を結び</size>",
					0
				},
				{
					"<size=45>一行は再び新紀元シティNO.2へ</size>",
					1
				},
				{
					"<size=45>「大魔王」安土の居城へと向かった。</size>",
					2
				}
			}
		}
	}
}
