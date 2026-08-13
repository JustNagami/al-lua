return {
	id = "CHENNIYUXINGGUANGZHICHENG41-1",
	mode = 2,
	fadeOut = 1.5,
	scripts = {
		{
			bgm = "theme-shallowoftheworld",
			side = 2,
			bgName = "star_level_bg_589",
			nameColor = "#A9F548FF",
			shakeTime = 2,
			say = "――――",
			soundeffect = "event:/ui/dalei",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			flashout = {
				black = false,
				dur = 1,
				alpha = {
					0,
					1
				}
			},
			effects = {
				{
					active = true,
					name = "yilishabai_alter_train_juqing"
				}
			}
		},
		{
			expression = 1,
			side = 2,
			bgName = "star_level_bg_589",
			actor = 900352,
			dir = 1,
			nameColor = "#FFC960",
			say = "「Dieu et mon droit」",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			effects = {
				{
					active = true,
					name = "jinguang"
				}
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "star_level_bg_589",
			say = "金色に輝くクイーンズライト号が流星のように天を駆け、純白と漆黒の間に鮮明な境界線を作り出した。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 900322,
			side = 2,
			bgName = "star_level_bg_589",
			nameColor = "#BDBDBD",
			dir = 1,
			say = "わお～きれいな列車だね～",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 900322,
			side = 2,
			bgName = "star_level_bg_589",
			nameColor = "#BDBDBD",
			dir = 1,
			say = "あなたが実験場βの今の切り札なのかな～？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 1,
			nameColor = "#FFC960",
			bgName = "star_level_bg_589",
			side = 2,
			dir = 1,
			actor = 900352,
			say = "…………",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 6,
			side = 2,
			bgName = "star_level_bg_589",
			actor = 900352,
			dir = 1,
			nameColor = "#FFC960",
			say = "「Honi soit qui mal y pense」",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			effects = {
				{
					active = true,
					name = "jinguang"
				}
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "star_level_bg_589",
			say = "金色の光が列車の各所から広がり、追い払った闇を深紅の甲冑巨人へと変えた。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			movableNode = {
				{
					time = 2.8,
					name = "youlin_ylsb",
					spine = {
						action = "move",
						scale = 1
					},
					path = {
						{
							-1000,
							300
						},
						{
							1600,
							300
						}
					}
				},
				{
					time = 2.8,
					name = "youlin_ylsb",
					spine = {
						action = "move",
						scale = 1
					},
					path = {
						{
							-1000,
							125
						},
						{
							1600,
							125
						}
					}
				},
				{
					time = 2.8,
					name = "youlin_ylsb",
					spine = {
						action = "move",
						scale = 1
					},
					path = {
						{
							-1000,
							-50
						},
						{
							1600,
							-50
						}
					}
				},
				{
					time = 2.8,
					name = "youlin_ylsb",
					spine = {
						action = "move",
						scale = 1
					},
					path = {
						{
							-1000,
							-225
						},
						{
							1600,
							-225
						}
					}
				},
				{
					time = 2.8,
					name = "youlin_ylsb",
					spine = {
						action = "move",
						scale = 1
					},
					path = {
						{
							-1000,
							-400
						},
						{
							1600,
							-400
						}
					}
				}
			}
		},
		{
			actor = 900322,
			side = 2,
			bgName = "star_level_bg_589",
			nameColor = "#BDBDBD",
			dir = 1,
			say = "おー、面白そうな技だねそれ！",
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
			actor = 900322,
			side = 2,
			bgName = "star_level_bg_589",
			nameColor = "#BDBDBD",
			dir = 1,
			say = "カッコイイ！ぼくも準備できたよ！さっさとかかってきて～！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
