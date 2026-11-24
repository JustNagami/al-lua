return {
	id = "ZHENLIXUEYUANDEZHUANXIAOSHENG11-3",
	mode = 2,
	fadeOut = 1.5,
	scripts = {
		{
			NextIcon = 1,
			side = 2,
			bgName = "star_level_bg_130",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			say = "マリーヤの宝石が神聖な光を放つと、「ロマンチック聖杯」がついにその真の姿を見せた。",
			bgm = "battle-inthememory",
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
			actor = 705100,
			nameColor = "#A9F548FF",
			bgName = "star_level_bg_130",
			hidePaintObj = true,
			dir = 1,
			NextIcon = 1,
			side = 2,
			say = "聖杯はもう目覚めた……あとは願い事さえすれば、全部終わる",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			options = {
				{
					content = "今の自分が…嫌なのか？",
					flag = 1
				}
			},
			optionsEffect = {
				1,
				1,
				1
			}
		},
		{
			side = 2,
			NextIcon = 1,
			bgName = "star_level_bg_130",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			say = "シノープの動きがぴたりと止まった。",
			bgm = "story-worldα-grief",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 3,
			side = 2,
			bgName = "star_level_bg_130",
			NextIcon = 1,
			dir = 1,
			actor = 705100,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "……ううん。嫌なんてそんな……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			portrait = "zhihuiguan",
			side = 2,
			bgName = "star_level_bg_130",
			hidePaintObj = true,
			actor = 0,
			NextIcon = 1,
			nameColor = "#A9F548FF",
			say = "――じゃあ、この7日間で経験したことは好き？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			portrait = "zhihuiguan",
			side = 2,
			bgName = "star_level_bg_381",
			hidePaintObj = true,
			actor = 0,
			NextIcon = 1,
			nameColor = "#A9F548FF",
			say = "――シノープ、ダンスの相手になってくれる？",
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
					name = "memoryFog"
				}
			}
		},
		{
			expression = 2,
			side = 2,
			bgName = "star_level_bg_600",
			NextIcon = 1,
			dir = 1,
			actor = 701130,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "シノープは？卒業したら何をするの？",
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
			actor = 705110,
			nameColor = "#A9F548FF",
			bgName = "star_level_bg_600",
			hidePaintObj = true,
			dir = 1,
			NextIcon = 1,
			side = 2,
			say = "何年経っても……あなたたちは私のかけがえのない友達よ",
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
			portrait = "zhihuiguan",
			side = 2,
			bgName = "star_level_bg_130",
			hidePaintObj = true,
			actor = 0,
			NextIcon = 1,
			nameColor = "#A9F548FF",
			say = "――美しいものは思い出の中にしか残らないわけじゃない。今この瞬間にも続いているんだ",
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
			}
		},
		{
			expression = 1,
			side = 2,
			bgName = "star_level_bg_130",
			NextIcon = 1,
			dir = 1,
			actor = 705100,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "でも……明日になったら全部終わっちゃうんでしょ？また離れ離れになって……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 1,
			side = 2,
			bgName = "star_level_bg_130",
			NextIcon = 1,
			dir = 1,
			actor = 705100,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "もう一度あなたを失うなんて、嫌…",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			portrait = "zhihuiguan",
			side = 2,
			bgName = "star_level_bg_130",
			hidePaintObj = true,
			actor = 0,
			NextIcon = 1,
			nameColor = "#A9F548FF",
			say = "――それは違うよ。シノープとならもっと輝かしい明日を作れるさ",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			portrait = "zhihuiguan",
			side = 2,
			bgName = "star_level_bg_130",
			hidePaintObj = true,
			actor = 0,
			NextIcon = 1,
			nameColor = "#A9F548FF",
			say = "――始めよう。今、この瞬間から",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			side = 2,
			NextIcon = 1,
			bgName = "star_level_bg_130",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			say = "シノープへ手を差し伸べた。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			portrait = "zhihuiguan",
			side = 2,
			bgName = "star_level_bg_130",
			hidePaintObj = true,
			actor = 0,
			NextIcon = 1,
			nameColor = "#A9F548FF",
			say = "――覚えてる？このダンスパーティーはまだ終わってない",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			portrait = "zhihuiguan",
			side = 2,
			bgName = "star_level_bg_130",
			hidePaintObj = true,
			actor = 0,
			NextIcon = 1,
			nameColor = "#A9F548FF",
			say = "――さぁ踊ろう。大切なパートナー",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 6,
			side = 2,
			bgName = "star_level_bg_130",
			NextIcon = 1,
			dir = 1,
			actor = 705100,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 7,
			side = 2,
			bgName = "star_level_bg_130",
			NextIcon = 1,
			dir = 1,
			actor = 705100,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "うん",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			asideType = 4,
			mode = 1,
			bgName = "star_level_bg_600",
			spacing = 30,
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
			rectMargin = {
				100,
				100,
				200,
				200
			},
			sequence = {
				{
					"<size=45>――モロトフがパーティーの前にしていたスピーチが、なぜか再び脳裏に蘇った。</size>",
					0
				},
				{
					"<size=45>「本来なら、慣例に従ってちゃんとした式辞を用意するところだけど」</size>",
					1
				},
				{
					"<size=45>「これから学園を巣立っていくみんなには、やはり心からの言葉を贈りたいと思う」</size>",
					2
				}
			}
		},
		{
			asideType = 4,
			mode = 1,
			bgName = "bg_zhenlixueyuan_1",
			spacing = 30,
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
			rectMargin = {
				100,
				100,
				200,
				200
			},
			sequence = {
				{
					"<size=45>「あなたたちはここで、数えきれないほどの黎明と黄昏を重ねてきた」</size>",
					0
				},
				{
					"「そんなありふれた毎日は、今は取るに足らないものに見えるかもしれない」",
					1
				},
				{
					"<size=45>「でも将来、歩んできた人生を振り返った時、あなたたちはきっと気づくはず」</size>",
					2
				},
				{
					"<size=45>「この他愛のない日々が、かけがえのない青春の一部だったと」</size>",
					3
				}
			}
		},
		{
			asideType = 4,
			mode = 1,
			bgName = "star_level_bg_381",
			spacing = 30,
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
			rectMargin = {
				100,
				100,
				200,
				200
			},
			sequence = {
				{
					"<size=45>「願わくば、これからの長い人生の中で時折思い出してみてほしい」</size>",
					0
				},
				{
					"<size=45>「今夜の灯火、音楽、隣に立っている人のことを」</size>",
					1
				},
				{
					"<size=45>「戸惑い、立ち止まる日が来ても、この記憶が再び前へ進む力になりますように」</size>",
					2
				},
				{
					"<size=45>「私からは以上よ」</size>",
					3
				}
			}
		},
		{
			bgName = "star_level_bg_381",
			mode = 1,
			asideType = 4,
			spacing = 30,
			rectMargin = {
				100,
				100,
				200,
				200
			},
			sequence = {
				{
					"<size=45>「さあ、思うままに踊り、存分に青春を謳歌しなさい」</size>",
					0
				}
			}
		},
		{
			side = 2,
			NextIcon = 1,
			bgName = "bg_zhenlixueyuan_2",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			say = "果てしない星空の下、二人は月明かりを浴びながら時を越えたステップを刻んだ。",
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
			bgName = "bg_zhenlixueyuan_2",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			say = "夜明けを告げる、最初の一筋の光が差すまで、ずっと――",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			blackBg = true,
			mode = 1,
			asideType = 1,
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
					"「THE END」",
					0
				}
			}
		},
		{
			portrait = "zhenlixueyuannpc_hei",
			side = 2,
			bgName = "bg_highschool_future",
			nameColor = "#A9F548FF",
			dir = 1,
			NextIcon = 1,
			bgm = "story-magicschool-pv",
			actorName = "？？",
			hidePaintObj = true,
			say = "おめでとう、私の主人公くん！見事にロマンチックな結末にたどり着いたね♪",
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
			portrait = "zhenlixueyuannpc_hei",
			side = 2,
			bgName = "bg_highschool_future",
			nameColor = "#A9F548FF",
			dir = 1,
			NextIcon = 1,
			actorName = "？？",
			hidePaintObj = true,
			say = "遊んでくれて本当にありがとう！主人公くんの選択は全部この胸に刻んで、いいインスピレーションをたくさんもらったよ♪",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			portrait = "zhenlixueyuannpc_hei",
			side = 2,
			bgName = "bg_highschool_future",
			nameColor = "#A9F548FF",
			dir = 1,
			NextIcon = 1,
			actorName = "？？",
			hidePaintObj = true,
			say = "最後に……遠くないうちにまた会おうね！私の主人公くん♪",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
