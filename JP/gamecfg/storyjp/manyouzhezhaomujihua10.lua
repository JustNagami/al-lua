return {
	fadeOut = 1.5,
	mode = 2,
	id = "MANYOUZHEZHAOMUJIHUA10",
	placeholder = {
		"playername"
	},
	scripts = {
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "star_level_bg_148",
			hidePaintObj = true,
			say = "埠頭の倉庫にある予備のセーフハウス。名寄が影の中から音もなく姿を現した。",
			bgm = "story-wanderingcity-pv",
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
			actor = 900539,
			side = 2,
			bgName = "star_level_bg_148",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			say = "デジタルカモフラージュをフルカバーしてきました。これでしばらく安全と言っていいでしょう",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 8,
			side = 2,
			bgName = "star_level_bg_148",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 900539,
			say = "今のソーン・シティではいつ状況が変わるかわからないですけどね……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 9,
			side = 2,
			bgName = "star_level_bg_148",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 900539,
			say = "指揮官、あまり時間は残されてませんけど……ワンダラーたちの勧誘に進展はありましたか？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			nameColor = "#A9F548FF",
			bgName = "star_level_bg_148",
			hidePaintObj = true,
			side = 2,
			portrait = "zhihuiguan",
			say = "――ランドンターブルのリストに載った者たちと一通り接触してきた",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 9,
			side = 2,
			bgName = "star_level_bg_148",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 900539,
			say = "あら？リストに載った者だけ……ですか？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 1,
			side = 2,
			bgName = "star_level_bg_148",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 900539,
			say = "じゃあそのリストに載っていない者は？指揮官は声かけるつもりはないのですか？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 5,
			side = 2,
			bgName = "star_level_bg_148",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 900539,
			say = "例えば、ずっと離れず君に付き合っている……私とか？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "star_level_bg_148",
			hidePaintObj = true,
			important = true,
			say = "名寄は期待の目で見つめてきた。その先に待ち受けているのは勝敗を決する一手か、それとも予測不可能なリスクか…。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			options = {
				{
					flag = 1,
					content = "名寄を仲間に誘う",
					globalFlag = {
						flagID = 1,
						flagValue = 100,
						flagIndex = 6
					}
				},
				{
					flag = 2,
					content = "仲間に誘わない",
					globalFlag = {
						flagID = 1,
						flagValue = 0,
						flagIndex = 6
					}
				}
			}
		},
		{
			portrait = "zhihuiguan",
			side = 2,
			bgName = "star_level_bg_148",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			optionFlag = 1,
			actor = 0,
			say = "――名寄は最初から部外者なんかじゃないさ",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			portrait = "zhihuiguan",
			side = 2,
			bgName = "star_level_bg_148",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			optionFlag = 1,
			actor = 0,
			say = "――ワンダラー小隊へようこそ",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 3,
			side = 2,
			bgName = "star_level_bg_148",
			dir = 1,
			optionFlag = 1,
			actor = 900539,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "さすが指揮官。いつも一番嬉しい選択をしてくれますわね～♪",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 900539,
			side = 2,
			bgName = "star_level_bg_148",
			hidePaintObj = true,
			dir = 1,
			optionFlag = 1,
			nameColor = "#A9F548FF",
			say = "ゲームの中でも人気なのが納得です♪",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			portrait = "zhihuiguan",
			side = 2,
			bgName = "star_level_bg_148",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			optionFlag = 1,
			actor = 0,
			say = "――雲龍、情報を全部同期してくれ。そろそろ決断を下す頃だ",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			portrait = "zhihuiguan",
			side = 2,
			bgName = "star_level_bg_148",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			optionFlag = 2,
			actor = 0,
			say = "――入隊の話はまた後にしよう。今すぐ名寄に頼みたいことがあるんだ",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 6,
			side = 2,
			bgName = "star_level_bg_148",
			dir = 1,
			optionFlag = 2,
			actor = 900539,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "今、ですか？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			portrait = "zhihuiguan",
			side = 2,
			bgName = "star_level_bg_148",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			optionFlag = 2,
			actor = 0,
			say = "――ああ。市政管理ビルのセキュリティスタッフの直近のシフトを調べてくれ",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			portrait = "zhihuiguan",
			side = 2,
			bgName = "star_level_bg_148",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			optionFlag = 2,
			actor = 0,
			say = "――それが手に入れば、後顧の憂いなく行動できる",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 1,
			side = 2,
			bgName = "star_level_bg_148",
			dir = 1,
			optionFlag = 2,
			actor = 900539,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "これは入隊テストですか？……分かりました指揮官、また後ほど会いましょう",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "star_level_bg_148",
			hidePaintObj = true,
			optionFlag = 2,
			say = "名寄がこの場から離れ、倉庫に残ったのは自分と――そのやり取りを隠れて見ていた雲龍だけになった。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 2,
			side = 2,
			bgName = "star_level_bg_148",
			dir = 1,
			optionFlag = 2,
			actor = 307171,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "指揮官……あの子をわざと遠ざけましたの？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			portrait = "zhihuiguan",
			side = 2,
			bgName = "star_level_bg_148",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			optionFlag = 2,
			actor = 0,
			say = "――慎重を期しただけだ。雲龍、情報を全て同期してくれ",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "star_level_bg_148",
			hidePaintObj = true,
			say = "雲龍が戦術指揮テーブルのホログラムシステムを起動させると、ソーン・シティの立体構造図が倉庫内に浮かび上がった。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 307171,
			side = 2,
			bgName = "star_level_bg_148",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			say = "今までまとめた情報から、確実に言えることがいくつかありますわ",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 307171,
			side = 2,
			bgName = "star_level_bg_148",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			say = "電波塔は市政管理ビルの最上階にあり、そこに集まるプレイヤーも多いですが、助っ人が十分いれば、それらを別のところに誘導することも可能かと",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 307171,
			side = 2,
			bgName = "star_level_bg_148",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			say = "それから、ゴリツィアのチップに入っていた零号協議のキーですけど",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 2,
			side = 2,
			bgName = "star_level_bg_148",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 307171,
			say = "臨海研究所はここからそれほど遠くありませんわ。道中のプレイヤーを引きつけるだけなら少人数で事足りますけど、中の状況が不明な以上……何に出くわすかまでは……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 307171,
			side = 2,
			bgName = "star_level_bg_148",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			say = "もちろん……このまま行動せず、機を待つという選択もありますわ",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 4,
			side = 2,
			bgName = "star_level_bg_148",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 307171,
			say = "君が決めてちょうだい。どんな選択でも……お姉さまは共にありますからね",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "star_level_bg_148",
			hidePaintObj = true,
			say = "情報、盟友、切り札……そして、来たる選択の時。机上に並べられた布石のすべてが、最後の一手を待っている。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			important = true,
			side = 2,
			bgName = "star_level_bg_148",
			hidePaintObj = true,
			say = "市政管理システム：この選択で、物語の結末が決められる。",
			sayColor = "#ff5c5c",
			bgm = "story-wanderingcity-pv",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			options = {
				{
					content = "零号協議を起動する",
					globalFlag = {
						flagID = 1,
						flagValue = 1000,
						flagIndex = 7
					}
				},
				{
					content = "管理ビルへ突入する",
					globalFlag = {
						flagID = 1,
						flagValue = 2000,
						flagIndex = 7
					}
				},
				{
					content = "様子見する",
					globalFlag = {
						flagID = 1,
						flagValue = 3000,
						flagIndex = 7
					}
				}
			}
		},
		{
			side = 2,
			jumpto = "MANYOUZHEZHAOMUJIHUA12",
			dir = 1,
			blackBg = true,
			say = "",
			globalOptionFlag = {
				id = 1,
				section = {
					{
						1003,
						1005
					}
				}
			},
			flashout = {
				black = true,
				dur = 0.5,
				alpha = {
					0,
					1
				}
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			side = 2,
			jumpto = "MANYOUZHEZHAOMUJIHUA13",
			dir = 1,
			blackBg = true,
			say = "",
			globalOptionFlag = {
				id = 1,
				section = {
					{
						1102,
						1105
					}
				}
			},
			flashout = {
				black = true,
				dur = 0.5,
				alpha = {
					0,
					1
				}
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			side = 2,
			jumpto = "MANYOUZHEZHAOMUJIHUA14",
			dir = 1,
			blackBg = true,
			say = "",
			globalOptionFlag = {
				id = 1,
				section = {
					{
						2004,
						2005
					}
				}
			},
			flashout = {
				black = true,
				dur = 0.5,
				alpha = {
					0,
					1
				}
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			side = 2,
			jumpto = "MANYOUZHEZHAOMUJIHUA15",
			dir = 1,
			blackBg = true,
			say = "",
			globalOptionFlag = {
				id = 1,
				section = {
					{
						2103,
						2105
					}
				}
			},
			flashout = {
				black = true,
				dur = 0.5,
				alpha = {
					0,
					1
				}
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			side = 2,
			jumpto = "MANYOUZHEZHAOMUJIHUA16",
			dir = 1,
			blackBg = true,
			say = "",
			globalOptionFlag = {
				id = 1,
				section = {
					{
						3000,
						3105
					}
				}
			},
			flashout = {
				black = true,
				dur = 0.5,
				alpha = {
					0,
					1
				}
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			side = 2,
			jumpto = "MANYOUZHEZHAOMUJIHUA17",
			dir = 1,
			blackBg = true,
			say = "",
			globalOptionFlag = {
				id = 1,
				section = {
					{
						1000,
						1002
					},
					{
						1100,
						1101
					},
					{
						2000,
						2003
					},
					{
						2100,
						2102
					}
				}
			},
			flashout = {
				black = true,
				dur = 0.5,
				alpha = {
					0,
					1
				}
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
