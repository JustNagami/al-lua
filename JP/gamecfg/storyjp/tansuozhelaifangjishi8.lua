return {
	fadeOut = 1.5,
	mode = 2,
	defaultTb = 3003,
	id = "TANSUOZHELAIFANGJISHI8",
	placeholder = {
		"tb"
	},
	scripts = {
		{
			actor = 1102010,
			side = 2,
			bgName = "star_level_bg_706",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			say = "今日も一生懸命咲いていますね……あ、指揮官、ようこそいらっしゃいました～。ローラーちゃんも一緒なんですね",
			bgm = "qe-ova-13",
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
			bgName = "star_level_bg_706",
			hidePaintObj = true,
			actor = -2,
			actorName = "ローラー",
			nameColor = "#A9F548FF",
			say = "ゼーヴェン、真剣に植物とお話をしているような……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 1102010,
			side = 2,
			bgName = "star_level_bg_706",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			say = "植物たちにも命がありますから、しっかりお世話をしなければなりませんよ",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			options = {
				{
					content = "――花たちに話しかけていたの？",
					flag = 1
				}
			}
		},
		{
			actor = 0,
			nameColor = "#A9F548FF",
			bgName = "star_level_bg_706",
			hidePaintObj = true,
			side = 2,
			portrait = "zhihuiguan",
			say = "――花たちに話しかけていたの？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 6,
			side = 2,
			bgName = "star_level_bg_706",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 1102010,
			say = "そうですよ。このチューリップは新しく移植したばかりなので、特に気を遣ってあげないといけませんから～",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 6,
			side = 2,
			bgName = "star_level_bg_706",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 1102010,
			say = "一輪一輪にそれぞれの成長リズムを持っていますので、細かく観察し、丁寧にお世話しなければなりません",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 3,
			side = 2,
			bgName = "star_level_bg_706",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 1102010,
			say = "たくさん話しかけてあげれば、花たちは美しくなろうと応えてくれます……指揮官さんはこういうお世話の仕方について…どう思いますか？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			options = {
				{
					content = "やっぱりゼーヴェンはお世話上手だな",
					flag = 1
				},
				{
					content = "やっぱりゼーヴェンは優しいな",
					flag = 2
				}
			}
		},
		{
			portrait = "zhihuiguan",
			side = 2,
			bgName = "star_level_bg_706",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			optionFlag = 1,
			actor = 0,
			say = "――やっぱり植物のお世話がすごく上手だな。ゼーヴェンは",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			portrait = "zhihuiguan",
			side = 2,
			bgName = "star_level_bg_706",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			optionFlag = 2,
			actor = 0,
			say = "――本当に優しく面倒を見ているな",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 6,
			side = 2,
			bgName = "star_level_bg_706",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 1102010,
			say = "そう言ってもらえて嬉しいです",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 1102010,
			side = 2,
			bgName = "star_level_bg_706",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			say = "それではお礼に、新しく淹れた花茶を飲んでいってください",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "star_level_bg_706",
			hidePaintObj = true,
			say = "デ・ゼーヴェン・プロヴィンシェンは、傍にあったティーポットを持ち上げ、花茶を二杯注いでくれた。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 1,
			side = 2,
			bgName = "star_level_bg_706",
			hidePaintObj = true,
			actor = -2,
			actorName = "ローラー",
			nameColor = "#A9F548FF",
			say = "自分の得意なことをしているだけなのに、すごく安心感を与えてくれますね……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = -2,
			nameColor = "#A9F548FF",
			bgName = "star_level_bg_706",
			hidePaintObj = true,
			xpression = 4,
			side = 2,
			actorName = "ローラー",
			say = "丁寧に花たちと向き合い、それぞれに適した育て方を探る……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 2,
			side = 2,
			bgName = "star_level_bg_706",
			hidePaintObj = true,
			actor = -2,
			actorName = "ローラー",
			nameColor = "#A9F548FF",
			say = "焦らず、じっくり育てる姿勢が心地よく感じる秘訣かも……？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 1102010,
			side = 2,
			bgName = "star_level_bg_706",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			say = "指揮官さん、植物の育て方と子育てはとても似ていると思いますよ",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 1102010,
			side = 2,
			bgName = "star_level_bg_706",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			say = "育てることに関しては、私かなり得意なんです～",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 3,
			side = 2,
			bgName = "star_level_bg_706",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 1102010,
			say = "さて、そろそろ他の植物の世話をしないといけませんから……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 3,
			side = 2,
			bgName = "star_level_bg_706",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 1102010,
			say = "引き続き、ごゆっくりご覧になっていてください～",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "star_level_bg_706",
			hidePaintObj = true,
			say = "しばらく庭園を見学した後、ローラーと一緒にその場を離れた。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
