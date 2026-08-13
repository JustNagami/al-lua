return {
	id = "CHENNIYUXINGGUANGZHICHENG41-4",
	mode = 2,
	fadeOut = 1.5,
	scripts = {
		{
			bgm = "theme-commander-ally",
			side = 2,
			bgName = "bg_xingguangcheng_3",
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
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "bg_xingguangcheng_3",
			say = "ハイエロファントたちが攻撃する中、ついに待ちに待った好機が訪れた。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 900322,
			side = 2,
			bgName = "bg_xingguangcheng_3",
			nameColor = "#BDBDBD",
			dir = 1,
			say = "へぇ……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			flashout = {
				black = false,
				dur = 0.25,
				alpha = {
					0,
					1
				}
			},
			flashin = {
				delay = 0.25,
				dur = 0.25,
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
			bgName = "bg_xingguangcheng_3",
			say = "ボノム・リシャールの笑顔が目の前に迫った。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			nameColor = "#A9F548FF",
			bgName = "bg_xingguangcheng_3",
			side = 2,
			portrait = "zhihuiguan",
			say = "――もらった！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "bg_xingguangcheng_3",
			say = "ミスDの助けを借りて、リシャールの手からデータディスクを奪い、すぐさま列車に戻った。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			nameColor = "#A9F548FF",
			bgName = "bg_xingguangcheng_3",
			side = 2,
			portrait = "zhihuiguan",
			say = "――「エリザベス」、発車だ！",
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
			bgName = "bg_xingguangcheng_3",
			nameColor = "#BDBDBD",
			dir = 1,
			say = "先生、もう行っちゃうのー？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 900322,
			side = 2,
			bgName = "bg_xingguangcheng_3",
			nameColor = "#BDBDBD",
			dir = 1,
			say = "一緒に遊んでくれたお礼に、プレゼントをあげるね♪",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			options = {
				{
					content = "……何のプレゼントだ？",
					flag = 1
				},
				{
					content = "……断ってもいいか？",
					flag = 2
				}
			}
		},
		{
			actor = 900322,
			side = 2,
			bgName = "bg_xingguangcheng_3",
			nameColor = "#BDBDBD",
			dir = 1,
			optionFlag = 1,
			say = "ちょっとした善意あふれる情報だよ～",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 900322,
			side = 2,
			bgName = "bg_xingguangcheng_3",
			nameColor = "#BDBDBD",
			dir = 1,
			optionFlag = 2,
			say = "あははー心配しないで、ただの情報だから",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 900322,
			side = 2,
			bgName = "bg_xingguangcheng_3",
			nameColor = "#BDBDBD",
			dir = 1,
			say = "ぼくを消滅させたくても、方法がわからなくて困ってるでしょ？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 900322,
			side = 2,
			bgName = "bg_xingguangcheng_3",
			nameColor = "#BDBDBD",
			dir = 1,
			say = "その方法はとてもシンプルだから、教えてあげてもいいよ～",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			nameColor = "#A9F548FF",
			bgName = "bg_xingguangcheng_3",
			side = 2,
			portrait = "zhihuiguan",
			say = "――……お前は何を言っているんだ？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 900322,
			nameColor = "#BDBDBD",
			bgName = "bg_xingguangcheng_3",
			side = 2,
			dir = 1,
			sayColor = "#ff5c5c",
			say = "「パンドラ」がぼくのコア。それを破壊すれば、ぼくも消える",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 900322,
			nameColor = "#BDBDBD",
			bgName = "bg_xingguangcheng_3",
			side = 2,
			dir = 1,
			sayColor = "#ff5c5c",
			say = "逆に言うと、ぼくがまだ存在してるってことはって話だけど……パンドラは今、どこにあると思う？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 2,
			nameColor = "#C3ABFF",
			bgName = "bg_xingguangcheng_3",
			side = 2,
			dir = 1,
			actor = 9707080,
			say = "……パンドラ…そんな、ありえない！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 900357,
			nameColor = "#BDBDBD",
			bgName = "bg_xingguangcheng_3",
			side = 2,
			actorName = "アビータ・Hierophant・V",
			say = "パンドラはとっくに……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 900322,
			side = 2,
			bgName = "bg_xingguangcheng_3",
			nameColor = "#BDBDBD",
			dir = 1,
			actorScale = 0.6,
			say = "油断したねぇ～！",
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
			side = 2,
			nameColor = "#A9F548FF",
			bgName = "bg_xingguangcheng_3",
			say = "黒い竜巻が突然その形を変え、まるで圧縮された槍のように列車へと向かって来た。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			effects = {
				{
					active = false,
					name = "speed"
				}
			}
		},
		{
			expression = 6,
			side = 2,
			bgName = "bg_xingguangcheng_3",
			actor = 900352,
			dir = 1,
			nameColor = "#FFC960",
			say = "発進準備——撤収よ！",
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
			portrait = 900322,
			side = 2,
			bgName = "bg_xingguangcheng_3",
			nameColor = "#BDBDBD",
			dir = 1,
			actorName = "ボノム・リシャール",
			say = "あははははは！！じゃあね！！また会いましょ～！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "star_level_bg_589",
			say = "金色の光に覆われる中で、クイーンズライト号はリシャールとその悪意に満ちた罠を後にした。",
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
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "star_level_bg_589",
			say = "車窓の外の空間が瞬く間に無限の虚無へと変わり、乗員全員に安全が訪れた。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
