return {
	id = "SHENGYINQIANDETONGMENG7",
	mode = 2,
	fadeOut = 1.5,
	scripts = {
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "storymap_lianhediguo",
			hidePaintObj = true,
			say = "翌日、「カラビニエーレ」、ゲッツ一行と共に「審判号」でレーゲンスブルク市の「神の水路」の入口へとやってきた。",
			bgm = "theme-hrr",
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
			},
			canMarkNode = {
				"storymap_lianhediguo",
				{
					"1_1"
				}
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			say = "「神の水路」と呼ばれているが、その実態はアンチエックスが残した人工運河網だ。",
			hidePaintObj = true,
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			canMarkNode = {
				"storymap_lianhediguo",
				{
					"1_1",
					"1_2"
				}
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			say = "物理的に神聖総連帝国の各主要都市を繋いでいるだけでなく、各所には大量の「神の通信施設」が設置されており、情報連絡を支えているらしい。",
			hidePaintObj = true,
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			canMarkNode = {
				"storymap_lianhediguo",
				{
					"1_1",
					"1_2"
				}
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			say = "大型の高速輸送船も配置されており、「審判号」すら簡単に収容でき、これで移動する予定だ。",
			hidePaintObj = true,
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			canMarkNode = {
				"storymap_lianhediguo",
				{
					"1_1",
					"1_2"
				}
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			say = "…水路は神聖総連帝国の皇帝に所有権があるという。",
			hidePaintObj = true,
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			canMarkNode = {
				"storymap_lianhediguo",
				{
					"1_1",
					"1_2"
				}
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			say = "しかし、実際の管理は複数の担当者に任されている。",
			hidePaintObj = true,
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			canMarkNode = {
				"storymap_lianhediguo",
				{
					"1_1",
					"1_2"
				}
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			say = "とにかく、マップを見るに、レーゲンスブルク市からブランデンブルクへ向かうには、３つの都市――",
			hidePaintObj = true,
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			canMarkNode = {
				"storymap_lianhediguo",
				{
					"1_1",
					"1_3"
				}
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			say = "ストラスブール市、マインツ市、マクデブルク市を経由する必要がある。",
			hidePaintObj = true,
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			canMarkNode = {
				"storymap_lianhediguo",
				{
					"1_1",
					"1_3",
					"1_4"
				}
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			say = "このまま行けば、夕方頃にストラスブール市に到着する予定だ。",
			hidePaintObj = true,
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			canMarkNode = {
				"storymap_lianhediguo",
				{
					"1_1",
					"1_3",
					"1_4",
					"1_5"
				}
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			say = "ゲッツと別行動しているU-2501とZ15ともそこで合流することになっている。",
			hidePaintObj = true,
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			canMarkNode = {
				"storymap_lianhediguo",
				{
					"1_1",
					"1_3",
					"1_4",
					"1_5",
					"1_6"
				}
			}
		},
		{
			expression = 3,
			side = 2,
			bgName = "star_level_bg_518",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 102160,
			say = "指揮官、通行可能の連絡が来たから、輸送船を起動できるわ",
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
			actor = 0,
			nameColor = "#A9F548FF",
			bgName = "star_level_bg_518",
			hidePaintObj = true,
			side = 2,
			portrait = "zhihuiguan",
			say = "――では、次の目的地へ向けて出発するとしよう",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			mode = 1,
			stopbgm = true,
			asideType = 3,
			blackBg = true,
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
			sequence = {
				{
					"神聖総連帝国",
					1
				},
				{
					"ストラスブール市",
					2
				},
				{
					"夕方",
					3
				}
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "star_level_bg_557",
			hidePaintObj = true,
			say = "夕焼けの中、輸送船はストラスブール市に到着した。",
			bgm = "story-hrr",
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
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "star_level_bg_557",
			hidePaintObj = true,
			say = "この区域を担当する「エルベ」が水路の出口まで出迎えに来てくれ、ゲッツたちと別行動だったU-2501とZ15も姿を現した。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "star_level_bg_557",
			hidePaintObj = true,
			say = "程なくして、悪い知らせがもたらされた。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 401150,
			side = 2,
			bgName = "star_level_bg_557",
			factiontag = "神聖総連帝国",
			dir = 1,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "というわけでみんな、調査を終えて戻ってきたよ～",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 3,
			side = 2,
			bgName = "star_level_bg_557",
			factiontag = "神聖総連帝国",
			dir = 1,
			actor = 401150,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "黒き領域の状況は正直言ってちょっとマズいかも……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 8,
			side = 2,
			bgName = "star_level_bg_557",
			factiontag = "神聖総連帝国",
			dir = 1,
			actor = 401150,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "水中で敵が攻勢準備を整えていることをU-2501が発見したの",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 4,
			side = 2,
			bgName = "star_level_bg_557",
			factiontag = "神聖総連帝国",
			dir = 1,
			actor = 401150,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "それに、もっと深い場所には、なにかもっと不吉なものが潜んでるみたい……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 9706050,
			side = 2,
			bgName = "star_level_bg_557",
			factiontag = "神聖総連帝国",
			dir = 1,
			nameColor = "#FFC960",
			hidePaintObj = true,
			say = "くっ……情勢がさらに悪化するなんて……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 1,
			side = 2,
			bgName = "star_level_bg_557",
			factiontag = "神聖総連帝国",
			dir = 1,
			actor = 408150,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "悪い知らせでごめん…",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			nameColor = "#A9F548FF",
			bgName = "star_level_bg_557",
			hidePaintObj = true,
			side = 2,
			portrait = "zhihuiguan",
			say = "（水中に……もっと不吉なもの？）",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			nameColor = "#A9F548FF",
			bgName = "star_level_bg_557",
			hidePaintObj = true,
			side = 2,
			portrait = "zhihuiguan",
			say = "（サディアの世界博覧会の時も、マルコ・ポーロが水中で何か弄っていた……）",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			nameColor = "#A9F548FF",
			bgName = "star_level_bg_557",
			hidePaintObj = true,
			side = 2,
			portrait = "zhihuiguan",
			say = "（あれのせいで敵が絶えずに出現していたのだが……）",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			nameColor = "#A9F548FF",
			bgName = "star_level_bg_557",
			hidePaintObj = true,
			side = 2,
			portrait = "zhihuiguan",
			say = "（原理は確か……）",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			nameColor = "#A9F548FF",
			bgName = "star_level_bg_557",
			hidePaintObj = true,
			side = 2,
			portrait = "zhihuiguan",
			say = "（うん……信仰の心象をある種の存在に変換した、ような…？）",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			nameColor = "#A9F548FF",
			bgName = "star_level_bg_557",
			hidePaintObj = true,
			side = 2,
			portrait = "zhihuiguan",
			say = "（今回もそういった装置があるんだろうか……）",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
