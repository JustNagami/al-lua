return {
	fadeOut = 1.5,
	mode = 2,
	id = "CAIDAN1",
	placeholder = {
		"playername"
	},
	scripts = {
		{
			side = 2,
			NextIcon = 1,
			bgName = "star_level_bg_308",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			say = "目を開けると、視界に映り込んだのは見知らぬ天井だった。",
			bgm = "story-hospital-light",
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
			},
			effects = {
				{
					active = true,
					name = "memoryFog"
				}
			}
		},
		{
			side = 2,
			NextIcon = 1,
			bgName = "star_level_bg_308",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			say = "消毒液のかすかな匂いと……フライドポテトのいい香りが漂っていた。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			side = 2,
			NextIcon = 1,
			bgName = "star_level_bg_308",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			say = "ベッド脇の白いカーテンの向こうから、少女の元気いっぱいの声が聞こえてきた。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			side = 2,
			nameColor = "#A9F548FF",
			bgName = "star_level_bg_308",
			hidePaintObj = true,
			dir = 1,
			NextIcon = 1,
			actorName = "？？",
			say = "わっ、指揮官、もうお目覚めですか！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			side = 2,
			nameColor = "#A9F548FF",
			bgName = "star_level_bg_308",
			hidePaintObj = true,
			dir = 1,
			NextIcon = 1,
			actorName = "？？",
			say = "『ロマン覚醒・オトナセット』と『ずっとときめき・お子さまセット』…どっちにしますか？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			portrait = "zhihuiguan",
			side = 2,
			bgName = "star_level_bg_308",
			hidePaintObj = true,
			actor = 0,
			NextIcon = 1,
			nameColor = "#A9F548FF",
			say = "――……オトナセットで",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			portrait = "zhihuiguan",
			side = 2,
			bgName = "star_level_bg_308",
			hidePaintObj = true,
			actor = 0,
			NextIcon = 1,
			nameColor = "#A9F548FF",
			say = "――いや、おまけのおもちゃが付いてくるなら…お子さまも悪くないかな",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
