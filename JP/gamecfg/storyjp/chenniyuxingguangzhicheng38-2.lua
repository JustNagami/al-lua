return {
	id = "CHENNIYUXINGGUANGZHICHENG38-2",
	mode = 2,
	fadeOut = 1.5,
	scripts = {
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "bg_xingguangcheng_2",
			say = "この好機にリシャールを倒す方針で決めると、各艦船それぞれ攻撃を開始した。",
			bgm = "theme-commander-ally",
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
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "bg_xingguangcheng_2",
			say = "――――！",
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
			expression = 5,
			nameColor = "#A9F548FF",
			bgName = "bg_xingguangcheng_2",
			side = 2,
			dir = 1,
			actor = 107200,
			say = "Boom——リシャール、包囲されてるよ！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 7,
			nameColor = "#A9F548FF",
			bgName = "bg_xingguangcheng_2",
			side = 2,
			dir = 1,
			actor = 102360,
			say = "リシャール先輩、投降してください",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "bg_xingguangcheng_2",
			say = "黒い影の軍勢は一撃で倒せるほど脆く弱い。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "bg_xingguangcheng_2",
			say = "そんな程度の敵しか操れないことも、今のボノム・リシャールの弱体化を裏付けている。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 2,
			nameColor = "#A9F548FF",
			bgName = "bg_xingguangcheng_2",
			side = 2,
			dir = 1,
			actor = 101580,
			say = "よくも……よくもみんなを長い間騙したわね！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 7,
			nameColor = "#A9F548FF",
			bgName = "bg_xingguangcheng_2",
			side = 2,
			dir = 1,
			actor = 101580,
			say = "うっ……うぅぅ……許せない！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 2,
			nameColor = "#A9F548FF",
			bgName = "bg_xingguangcheng_2",
			side = 2,
			dir = 1,
			actor = 101570,
			say = "ひどすぎるよ、リシャール",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 1,
			nameColor = "#FEF15E",
			bgName = "bg_xingguangcheng_2",
			side = 2,
			dir = 1,
			actor = 900534,
			say = "えへへ……ごめんね、こっちにも事情があるんだ",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 1,
			nameColor = "#FEF15E",
			bgName = "bg_xingguangcheng_2",
			side = 2,
			dir = 1,
			actor = 900534,
			say = "先生がマスターテープを渡してくれたら、全員無事に帰すと約束するよ？どうかな？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 3,
			nameColor = "#A9F548FF",
			bgName = "bg_xingguangcheng_2",
			side = 2,
			dir = 1,
			actor = 107200,
			say = "あはは～、明らかにこっちのほうが優勢だと思うけど？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 2,
			nameColor = "#FEF15E",
			bgName = "bg_xingguangcheng_2",
			side = 2,
			dir = 1,
			actor = 900534,
			say = "そうだね。ぼくはマスターテープが手に入らないと力が戻らない、だから今のうちにぼくを倒そうという作戦だよね。先生？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 1,
			nameColor = "#FEF15E",
			bgName = "bg_xingguangcheng_2",
			side = 2,
			dir = 1,
			actor = 900534,
			say = "でもよく見て？ぼく、傷を負ってるように見えるかな？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			nameColor = "#A9F548FF",
			bgName = "bg_xingguangcheng_2",
			side = 2,
			portrait = "zhihuiguan",
			say = "…………",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "bg_xingguangcheng_2",
			say = "戦闘が始まってから一方的に攻撃を受け続けてきたのに、リシャールの服にはしわ一つできておらず、髪もまるで乱れていない。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "bg_xingguangcheng_2",
			say = "ただ笑みを浮かべながら飛び交う砲火を眺め、静かに何かを待ち続けていた。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			nameColor = "#A9F548FF",
			bgName = "bg_xingguangcheng_2",
			side = 2,
			portrait = "zhihuiguan",
			say = "――……何を待ってるんだ？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 1,
			nameColor = "#FEF15E",
			bgName = "bg_xingguangcheng_2",
			side = 2,
			dir = 1,
			actor = 900534,
			say = "もちろん、自分の縛りが解ける瞬間だよ～",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 900534,
			side = 2,
			bgName = "bg_xingguangcheng_2",
			nameColor = "#FEF15E",
			dir = 1,
			say = "まさか、自分が施した縛りを自分で解けないとでも思ってる？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			nameColor = "#A9F548FF",
			bgName = "bg_xingguangcheng_2",
			side = 2,
			portrait = "zhihuiguan",
			say = "――当然わかっている。だからこそ……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 2,
			nameColor = "#FEF15E",
			bgName = "bg_xingguangcheng_2",
			side = 2,
			dir = 1,
			actor = 900534,
			say = "火力がしょぼすぎるよ～。だから先生、君たちの負け——",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 900322,
			side = 2,
			bgName = "bg_xingguangcheng_2",
			nameColor = "#BDBDBD",
			dir = 1,
			say = "ひひひひひひひひっ——",
			actorScale = 0.4,
			bgm = "theme-richard",
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
			},
			effects = {
				{
					active = true,
					name = "juqing_mengjing"
				}
			},
			action = {
				{
					type = "shake",
					y = 10,
					delay = 0,
					dur = 0.1,
					number = 3
				},
				{
					delay = 0.2,
					dur = 0.1,
					type = "zoom",
					to = {
						0.7,
						0.7,
						0.7
					}
				},
				{
					type = "shake",
					y = 10,
					delay = 0.4,
					dur = 0.1,
					number = 3
				},
				{
					delay = 0.6,
					dur = 0.1,
					type = "zoom",
					to = {
						1,
						1,
						1
					}
				},
				{
					type = "shake",
					y = 10,
					delay = 0.8,
					dur = 0.1,
					number = 3
				}
			}
		},
		{
			actor = 900322,
			side = 2,
			bgName = "bg_xingguangcheng_2",
			nameColor = "#BDBDBD",
			dir = 1,
			say = "改めて自己紹介！ぼくはボノム・リシャール！君たちはもうぼくに包囲されているよ～",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			nameColor = "#A9F548FF",
			bgName = "bg_xingguangcheng_2",
			side = 2,
			portrait = "zhihuiguan",
			say = "――しまっ……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "bg_xingguangcheng_2",
			say = "宙に浮く光の陣列が突如砕け、全員落下し始めた。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 5,
			side = 2,
			bgName = "bg_xingguangcheng_2",
			actor = 900430,
			dir = 1,
			nameColor = "#A9F548FF",
			say = "うわあああ——！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			dialogShake = {
				speed = 0.08,
				x = 15,
				number = 2
			},
			action = {
				{
					type = "shake",
					y = 45,
					delay = 0,
					dur = 0.15,
					x = 0,
					number = 2
				}
			}
		},
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
					"火力が足りなかったせいで、間に合わなかったのか？",
					0
				}
			}
		}
	}
}
