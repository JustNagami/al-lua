return {
	id = "SHANYAOBULIDAZUOZHAN3-6",
	mode = 2,
	fadeOut = 1.5,
	scripts = {
		{
			asideType = 4,
			mode = 1,
			spacing = 30,
			rectAlpha = 0,
			blackBg = true,
			flashout = {
				black = true,
				dur = 1,
				alpha = {
					0,
					1
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
					"「数々の修羅場をくぐりぬけ彼女たちの前に、最後の強敵が現れた――」",
					0
				}
			}
		},
		{
			actorName = "恐ろしき大魔王",
			side = 2,
			bgName = "star_level_bg_596",
			factiontag = "demon★king",
			bgm = "theme-vanguard",
			actor = 900233,
			nameColor = "#FF9B93",
			hidePaintObj = true,
			say = "クックックッ……そこまでだ！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			flashin = {
				delay = 0,
				dur = 1,
				black = true,
				alpha = {
					1,
					0
				}
			}
		},
		{
			actor = 204040,
			side = 2,
			bgName = "star_level_bg_596",
			factiontag = "little★knight",
			dir = 1,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "そのセリフ、もう三回目なんですけど……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 3,
			side = 2,
			bgName = "star_level_bg_596",
			factiontag = "demon★king",
			actorName = "恐ろしき大魔王",
			actor = 900233,
			nameColor = "#FF9B93",
			hidePaintObj = true,
			say = "こほん……この万能キューブは強者の象徴、支配するには貧弱な者ではつとまらないッ！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 1,
			side = 2,
			bgName = "star_level_bg_596",
			factiontag = "demon★king",
			actorName = "恐ろしき大魔王",
			actor = 900233,
			nameColor = "#FF9B93",
			hidePaintObj = true,
			say = "だからこそ「恐怖の大魔王」であるこの私にふさわしいッ！このキューブ、絶対手に入れてやる！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			dialogShake = {
				speed = 0.08,
				x = 15,
				number = 2
			}
		},
		{
			actor = 204040,
			side = 2,
			bgName = "star_level_bg_596",
			factiontag = "little★knight",
			dir = 1,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "させません！悪の大魔王よ、その野望を打ち砕いてみせます！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 100002,
			side = 2,
			bgName = "star_level_bg_596",
			factiontag = "magic★buli",
			dir = 1,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "愛と平和と友情と正義と勝利のために、ブリの名に代わってお仕置きよ――！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			dialogShake = {
				speed = 0.08,
				x = 15,
				number = 2
			}
		},
		{
			expression = 3,
			side = 2,
			bgName = "star_level_bg_596",
			factiontag = "demon★king",
			actorName = "恐ろしき大魔王",
			actor = 900233,
			nameColor = "#FF9B93",
			hidePaintObj = true,
			say = "フンッ！勝った者は油断するのが道理、油断した者は敗れるものよ！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 900233,
			nameColor = "#FF9B93",
			bgName = "star_level_bg_596",
			factiontag = "demon★king",
			side = 2,
			actorName = "恐ろしき大魔王",
			hidePaintObj = true,
			say = "二連勝したからって、次も勝てるとは限らない！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 1,
			side = 2,
			bgName = "star_level_bg_596",
			factiontag = "demon★king",
			actorName = "恐ろしき大魔王",
			actor = 900233,
			nameColor = "#FF9B93",
			hidePaintObj = true,
			say = "喰らえ――！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			effects = {
				{
					active = true,
					name = "speed"
				}
			},
			dialogShake = {
				speed = 0.08,
				x = 15,
				number = 2
			}
		}
	}
}
