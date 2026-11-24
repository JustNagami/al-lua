return {
	id = "ZHENLIXUEYUANDEZHUANXIAOSHENG6-2",
	mode = 2,
	fadeOut = 1.5,
	scripts = {
		{
			side = 2,
			NextIcon = 1,
			bgName = "star_level_bg_311",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			bgm = "story-richang-afterschool",
			say = "RRRUMBLE...",
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
			side = 2,
			NextIcon = 1,
			bgName = "star_level_bg_311",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			say = "Thanks to Molotov's well-aimed barrage of magic missiles and Sinop's spectral army, the monsters are quickly driven back.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			side = 2,
			NextIcon = 1,
			bgName = "star_level_bg_311",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			say = "We follow the fleeing enemy to a door left slightly ajar.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 4,
			side = 2,
			bgName = "star_level_bg_311",
			NextIcon = 1,
			dir = 1,
			actor = 705100,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "Be careful. Someone's inside.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			side = 2,
			NextIcon = 1,
			bgName = "star_level_bg_381",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			say = "Behind the door is a bizarre scene.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
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
			}
		},
		{
			side = 2,
			NextIcon = 1,
			bgName = "star_level_bg_381",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			say = "Hero and her friends lounge comfortably atop beds and massage chairs, receiving back rubs from the monsters.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			side = 2,
			NextIcon = 1,
			bgName = "star_level_bg_381",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			say = "A small grail floats beside them, radiating a constant flow of magic.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			icon = {
				scale = 2,
				image = "Props/66133",
				pos = {
					0,
					0
				}
			}
		},
		{
			actor = 101271,
			nameColor = "#A9F548FF",
			bgName = "star_level_bg_381",
			hidePaintObj = true,
			dir = 1,
			NextIcon = 1,
			side = 2,
			say = "Hero, what time is it?",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 5,
			side = 2,
			bgName = "star_level_bg_381",
			NextIcon = 1,
			dir = 1,
			actor = 201361,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "Get your head on straight. We don't have to go to school anymore! We wished to make every day the weekend, remember?",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			side = 2,
			NextIcon = 1,
			bgName = "star_level_bg_381",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			say = "She lifts a hand, prompting the monster made of golden coins to hand over a calendar.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 2,
			side = 2,
			bgName = "star_level_bg_381",
			NextIcon = 1,
			dir = 1,
			actor = 101161,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "You're right! It's all Saturday and Sunday!",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 702130,
			nameColor = "#A9F548FF",
			bgName = "star_level_bg_381",
			hidePaintObj = true,
			dir = 1,
			NextIcon = 1,
			side = 2,
			say = "Hero, you've been playing hooky for days. Come to class.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 2,
			side = 2,
			bgName = "star_level_bg_381",
			NextIcon = 1,
			dir = 1,
			actor = 201361,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "Whoa, the professor's here. Hah! As if I'd ever go to class again!",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 2,
			side = 2,
			bgName = "star_level_bg_381",
			NextIcon = 1,
			dir = 1,
			actor = 201361,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "We have the all-powerful grail on our side. You can't stop us now!",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
