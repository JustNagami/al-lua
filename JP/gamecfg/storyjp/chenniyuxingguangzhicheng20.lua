return {
	id = "CHENNIYUXINGGUANGZHICHENG20",
	mode = 2,
	fadeOut = 1.5,
	scripts = {
		{
			blackBg = true,
			mode = 1,
			asideType = 3,
			bgm = "doa-az-story-1",
			flashout = {
				black = true,
				dur = 1,
				alpha = {
					0,
					1
				}
			},
			sequence = {
				{
					"メトロスターライト",
					1
				},
				{
					"下層エリア・？？コミュニティ",
					2
				},
				{
					"翌日の正午",
					3
				}
			}
		},
		{
			portrait = "RED",
			side = 2,
			bgName = "star_level_bg_194",
			hidePaintObj = true,
			actorName = "警備員RED",
			nameColor = "#A9F548FF",
			say = "どうした？後悔した？さっさと始めるよ！",
			hideRecordIco = true,
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
			expression = 2,
			side = 2,
			bgName = "star_level_bg_194",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 900479,
			say = "やっちゃえ～名探偵先生！腕相撲で勝って～",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			nameColor = "#A9F548FF",
			bgName = "star_level_bg_194",
			hidePaintObj = true,
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
			bgName = "star_level_bg_194",
			hidePaintObj = true,
			say = "今、奇妙なコミュニティで、わけもわからぬまま警備員と腕相撲をすることになった。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "star_level_bg_194",
			hidePaintObj = true,
			say = "事の発端はというと――",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
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
					"少し前――",
					0
				}
			}
		},
		{
			expression = 3,
			side = 2,
			bgName = "star_level_bg_529",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 102360,
			say = "そういうことですので、ライブ会場の使用許可証をいただけませんか？",
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
			effects = {
				{
					active = true,
					name = "memoryFog"
				}
			}
		},
		{
			portrait = "GREY",
			side = 2,
			bgName = "star_level_bg_529",
			hidePaintObj = true,
			actorName = "担当者GREY",
			nameColor = "#A9F548FF",
			say = "ほんと憂鬱だ……ぼくらが誇る夢の都がもやに包まれてしまった……",
			hideRecordIco = true,
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 2,
			side = 2,
			bgName = "star_level_bg_529",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 102360,
			say = "……えっ？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			portrait = "GREY",
			side = 2,
			bgName = "star_level_bg_529",
			hidePaintObj = true,
			actorName = "担当者GREY",
			nameColor = "#A9F548FF",
			say = "この街には応えられない願いが多すぎる……はあ……憂鬱……",
			hideRecordIco = true,
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 101580,
			side = 2,
			bgName = "star_level_bg_529",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			say = "つまり何かしらの依頼があるんでしょ？早く言いなさい！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			portrait = "GREY",
			side = 2,
			bgName = "star_level_bg_529",
			hidePaintObj = true,
			actorName = "担当者GREY",
			nameColor = "#A9F548FF",
			say = "願いに応えてもらえないコミュニティに行って、応える者のいない願いを解決して……",
			hideRecordIco = true,
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			portrait = "GREY",
			side = 2,
			bgName = "star_level_bg_529",
			hidePaintObj = true,
			actorName = "担当者GREY",
			nameColor = "#A9F548FF",
			say = "それができたら許可証を渡すよ……",
			hideRecordIco = true,
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 7,
			side = 2,
			bgName = "star_level_bg_529",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 101570,
			say = "……地域奉仕みたいなもの？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			nameColor = "#A9F548FF",
			bgName = "star_level_bg_529",
			hidePaintObj = true,
			side = 2,
			portrait = "zhihuiguan",
			say = "――難しくはなさそうだな、さくっと片付けてこよう",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			portrait = "zhihuiguan",
			side = 2,
			bgName = "star_level_bg_194",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			actor = 0,
			say = "――誰かと腕相撲で勝負することが願いって、どういうことなんだ……？",
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
					active = false,
					name = "memoryFog"
				}
			},
			options = {
				{
					content = "腕相撲を始める",
					flag = 1
				}
			},
			location = {
				"下層エリア・？？コミュニティ",
				3
			}
		},
		{
			portrait = "RED",
			side = 2,
			bgName = "star_level_bg_194",
			hidePaintObj = true,
			actorName = "警備員RED",
			nameColor = "#A9F548FF",
			say = "ふん、腕がへし折られないといいね！",
			hideRecordIco = true,
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			portrait = "RED",
			side = 2,
			bgName = "star_level_bg_194",
			hidePaintObj = true,
			actorName = "警備員RED",
			nameColor = "#A9F548FF",
			say = "まさか負けるとは……",
			hideRecordIco = true,
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
			portrait = "RED",
			side = 2,
			bgName = "star_level_bg_194",
			hidePaintObj = true,
			actorName = "警備員RED",
			nameColor = "#A9F548FF",
			say = "まさに能ある鷹は爪を隠す……悔いはない……",
			hideRecordIco = true,
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "star_level_bg_194",
			hidePaintObj = true,
			say = "警備員REDは光の粒となって消えていった。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 2,
			side = 2,
			bgName = "star_level_bg_194",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 900479,
			say = "さすが名探偵先生～次の依頼に行こう！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			portrait = "BLUE",
			side = 2,
			bgName = "star_level_bg_178",
			hidePaintObj = true,
			actorName = "物乞いBLUE",
			nameColor = "#A9F548FF",
			say = "誰か親切な人はいないか……？",
			hideRecordIco = true,
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
			location = {
				"下層エリア・？？コミュニティ",
				3
			}
		},
		{
			expression = 1,
			side = 2,
			bgName = "star_level_bg_178",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 107200,
			say = "その親切な人が来たよ～",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 1,
			side = 2,
			bgName = "star_level_bg_178",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 107200,
			say = "どうぞ、助けになればいいんだけど～",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			options = {
				{
					content = "金貨を渡す",
					flag = 1
				}
			}
		},
		{
			portrait = "BLUE",
			side = 2,
			bgName = "star_level_bg_178",
			hidePaintObj = true,
			actorName = "物乞いBLUE",
			nameColor = "#A9F548FF",
			say = "ようやく手を差し伸べてくれる人が……ありがとう……",
			hideRecordIco = true,
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
			bgName = "star_level_bg_178",
			hidePaintObj = true,
			say = "物乞いBLUEは光の粒となって消えていった。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 2,
			side = 2,
			bgName = "star_level_bg_178",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 101580,
			say = "次、次～！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			portrait = "YELLOW",
			side = 2,
			bgName = "star_level_bg_583",
			hidePaintObj = true,
			actorName = "貴族YELLOW",
			nameColor = "#A9F548FF",
			say = "だ……だれ！？た、助けて！助けて！！",
			hideRecordIco = true,
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
			location = {
				"下層エリア・？？コミュニティ",
				3
			}
		},
		{
			expression = 4,
			side = 2,
			bgName = "star_level_bg_583",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 102360,
			say = "ご安心ください。今すぐ縄を解きますね～",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			options = {
				{
					content = "縄を解く",
					flag = 1
				}
			}
		},
		{
			portrait = "YELLOW",
			side = 2,
			bgName = "star_level_bg_583",
			hidePaintObj = true,
			actorName = "貴族YELLOW",
			nameColor = "#A9F548FF",
			say = "やっと助かった……ありがとう……",
			hideRecordIco = true,
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
			bgName = "star_level_bg_583",
			hidePaintObj = true,
			say = "貴族YELLOWは光の粒となって消えていった。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 9,
			side = 2,
			bgName = "star_level_bg_583",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 101570,
			say = "次の助けを必要としている方のところへ行きましょう～",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			portrait = "BLACK",
			side = 2,
			bgName = "star_level_bg_178",
			hidePaintObj = true,
			actorName = "子どもBLACK",
			nameColor = "#A9F548FF",
			say = "誰か手伝ってー。猫ちゃんが屋根に上って降りてこない……",
			hideRecordIco = true,
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
			location = {
				"下層エリア・？？コミュニティ",
				3
			}
		},
		{
			paintingNoise = true,
			side = 2,
			bgName = "star_level_bg_178",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 101560,
			say = "エラーⅩⅢ世に乗れば屋根まで行けるよ",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			options = {
				{
					content = "屋根へ行って猫を救助",
					flag = 1
				}
			}
		},
		{
			portrait = "BLACK",
			side = 2,
			bgName = "star_level_bg_178",
			hidePaintObj = true,
			actorName = "子どもBLACK",
			nameColor = "#A9F548FF",
			say = "わあ、ありがとう！うれしい……",
			hideRecordIco = true,
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
			bgName = "star_level_bg_178",
			hidePaintObj = true,
			say = "子どもBLACKは光の粒となって消えていった。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			nameColor = "#A9F548FF",
			bgName = "star_level_bg_178",
			hidePaintObj = true,
			side = 2,
			portrait = "zhihuiguan",
			say = "――……いつまで続くんだこれ？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 5,
			side = 2,
			bgName = "star_level_bg_178",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 107094,
			say = "おそらく、このエリアにいる全員の依頼を解決するまでかと……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 107094,
			side = 2,
			bgName = "star_level_bg_178",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			say = "次の場所へ行きましょう",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			portrait = "GREEN",
			side = 2,
			bgName = "star_level_bg_305",
			hidePaintObj = true,
			actorName = "裁縫GREEN",
			nameColor = "#A9F548FF",
			say = "怪我をしてしまって……誰か煙突の掃除を手伝ってくれないかな……",
			hideRecordIco = true,
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
			location = {
				"下層エリア・？？コミュニティ",
				3
			}
		},
		{
			actor = 900479,
			side = 2,
			bgName = "star_level_bg_305",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			say = "じーっ",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			portrait = "zhihuiguan",
			side = 2,
			bgName = "star_level_bg_305",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			actor = 0,
			say = "――これが最後だといいな……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			options = {
				{
					content = "煙突を掃除する",
					flag = 1
				}
			}
		},
		{
			portrait = "GREEN",
			side = 2,
			bgName = "star_level_bg_305",
			hidePaintObj = true,
			actorName = "裁縫GREEN",
			nameColor = "#A9F548FF",
			say = "煙突がきれいになった……ありがとう……",
			hideRecordIco = true,
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
			bgName = "star_level_bg_305",
			hidePaintObj = true,
			say = "裁縫GREENは光の粒となって消えていった。そんな中、責任者GREYが姿を現した。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			portrait = "GREY",
			side = 2,
			bgName = "star_level_bg_305",
			hidePaintObj = true,
			actorName = "担当者GREY",
			nameColor = "#A9F548FF",
			say = "きみたちは心優しい人々だ。見事に試練を乗り越えた……",
			hideRecordIco = true,
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			portrait = "GREY",
			side = 2,
			bgName = "star_level_bg_305",
			hidePaintObj = true,
			actorName = "担当者GREY",
			nameColor = "#A9F548FF",
			say = "これが報酬よ、会場使用許可証を受け取って……",
			hideRecordIco = true,
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "star_level_bg_305",
			hidePaintObj = true,
			say = "そう言うと、責任者GREYもまた光の粒となって消えていった。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 5,
			side = 2,
			bgName = "star_level_bg_305",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 900479,
			say = "先生、それにみんなもお疲れさま～。これでまた一枚、許可証が手に入ったね！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			nameColor = "#A9F548FF",
			bgName = "star_level_bg_305",
			hidePaintObj = true,
			side = 2,
			portrait = "zhihuiguan",
			say = "――やっと終わった……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 2,
			side = 2,
			bgName = "star_level_bg_305",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 107094,
			say = "これは記録に残すべき異常事件ですね……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 6,
			side = 2,
			bgName = "star_level_bg_305",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 107094,
			say = "……戻って新しいノートを作りましょう",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
