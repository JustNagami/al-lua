return {
	fadeOut = 1.5,
	mode = 2,
	id = "ZHENLIXUEYUANDEZHUANXIAOSHENG1",
	placeholder = {
		"playername"
	},
	scripts = {
		{
			bgName = "bg_zhenlixueyuan_cg2",
			mode = 1,
			asideType = 4,
			spacing = 30,
			bgm = "story-richang-afterschool",
			flashin = {
				delay = 0,
				dur = 1,
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
					"転校生であるあなたは、謎多き魔導教育機構「真理学園」へと足を踏み入れた",
					0
				},
				{
					"あなたはそこで運命の少女たちと出会い、愛と戦いが交錯する物語の果てに選択を下すこととなる",
					1
				},
				{
					"<size=45>恋の季節に、運命の歯車が回り始める</size>",
					2
				},
				{
					"<size=45>――『真理学園の転校生』</size>",
					3
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
					"<size=45>ひとつひとつの選択がかけがえのないものになる。忘れないように</size>",
					0
				}
			}
		},
		{
			side = 2,
			NextIcon = 1,
			bgName = "star_level_bg_156",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			say = "まばゆい光が消え、目を開けると、巨大な転送装置の中央に立っていた。",
			bgm = "story-nonightcity",
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
			flashin = {
				delay = 1,
				dur = 1,
				black = false,
				alpha = {
					1,
					0
				}
			}
		},
		{
			expression = 1,
			side = 2,
			bgName = "star_level_bg_156",
			NextIcon = 1,
			dir = 1,
			actor = 701091,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "「魔管局」へようこそ、伝説のエージェント{playername}。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 1,
			side = 2,
			bgName = "star_level_bg_156",
			NextIcon = 1,
			dir = 1,
			actor = 701091,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "やっと、この局長直々の召喚に応じてくれたな！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			options = {
				{
					content = "魔管局って？",
					flag = 1
				},
				{
					content = "恋愛アドベンチャーって聞いたけど？",
					flag = 2
				},
				{
					content = "問おう、あなたが……",
					flag = 3
				}
			},
			optionsEffect = {
				1,
				1,
				1
			}
		},
		{
			expression = 5,
			side = 2,
			bgName = "star_level_bg_156",
			NextIcon = 1,
			dir = 1,
			optionFlag = 1,
			actor = 701091,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "魔法科学技術管理局、略して魔管局だ",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 5,
			side = 2,
			bgName = "star_level_bg_156",
			NextIcon = 1,
			dir = 1,
			optionFlag = 2,
			actor = 701091,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "まあ焦るなって。今「アドベンチャー」の部分を説明してるとこじゃないか",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 3,
			side = 2,
			bgName = "star_level_bg_156",
			NextIcon = 1,
			dir = 1,
			optionFlag = 3,
			actor = 701091,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "いかん！そこまでだ！確かにそれっぽい流れだけど、断じてそういうものではないぞ！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 1,
			side = 2,
			bgName = "star_level_bg_156",
			NextIcon = 1,
			dir = 1,
			actor = 701091,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "上の意向で、SSSランクのある任務をお前に委ねることとなった",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 701091,
			nameColor = "#A9F548FF",
			bgName = "star_level_bg_156",
			hidePaintObj = true,
			dir = 1,
			NextIcon = 1,
			side = 2,
			say = "任務の場所とはずばり魔法を教える学び舎――「真理学園」。隣国の皇女「マリーヤ」が、7日間の短期留学でそこを訪れる",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 1,
			side = 2,
			bgName = "star_level_bg_156",
			NextIcon = 1,
			dir = 1,
			actor = 701091,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "その間、学生として学園へ潜入および彼女を護衛しつつ、あらゆる脅威を排除してもらう",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 701091,
			nameColor = "#A9F548FF",
			bgName = "star_level_bg_156",
			hidePaintObj = true,
			dir = 1,
			NextIcon = 1,
			side = 2,
			say = "学園内に、協力役として既にもう一人エージェントを潜り込ませてある",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 1,
			side = 2,
			bgName = "star_level_bg_156",
			NextIcon = 1,
			dir = 1,
			actor = 701091,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "潜入後、合言葉を交わせば合流できる手筈となっているぞ",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 1,
			side = 2,
			bgName = "star_level_bg_156",
			NextIcon = 1,
			dir = 1,
			actor = 701091,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "何事もなく、<color=#ff5c5c>7日間</color>過ごすことができたら任務完了だ"
		},
		{
			portrait = "zhihuiguan",
			side = 2,
			bgName = "star_level_bg_156",
			hidePaintObj = true,
			actor = 0,
			NextIcon = 1,
			nameColor = "#A9F548FF",
			say = "――何事も起きないようにするなんて、まるでできる気がしないが……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 1,
			side = 2,
			bgName = "star_level_bg_156",
			NextIcon = 1,
			dir = 1,
			actor = 701091,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "チュートリアルは以上だ！さあ伝説のエージェント、今すぐ真理学園へ向かい、任務を開始せよ！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			blackBg = true,
			mode = 1,
			flashout = {
				black = false,
				dur = 1,
				alpha = {
					0,
					1
				}
			},
			flashin = {
				delay = 1,
				dur = 1,
				black = false,
				alpha = {
					1,
					0
				}
			},
			effects = {
				{
					active = true,
					name = "zhenlixueyuandezhuanxiaosheng"
				}
			},
			sequence = {
				{
					"",
					1
				}
			}
		}
	}
}
