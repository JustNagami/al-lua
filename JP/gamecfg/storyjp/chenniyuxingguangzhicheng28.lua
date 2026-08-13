return {
	id = "CHENNIYUXINGGUANGZHICHENG28",
	mode = 2,
	fadeOut = 1.5,
	scripts = {
		{
			blackBg = true,
			mode = 1,
			asideType = 3,
			bgm = "battle-starcity-rhythm",
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
					"下層エリア・西工業エリア？",
					2
				},
				{
					"しばらくして",
					3
				}
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "star_level_bg_301",
			hidePaintObj = true,
			say = "辺りが濃い霧によって覆われ、気づくと自分たちは廃工場の前に立っていた。",
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
			expression = 1,
			side = 2,
			bgName = "star_level_bg_301",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 107200,
			say = "Unbelievable～！広告カードを拾ったら、ほんとに廃工場に飛ばされちゃった！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 2,
			side = 2,
			bgName = "star_level_bg_301",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 107094,
			say = "やっぱり……どこか引っかかりますね……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 2,
			side = 2,
			bgName = "star_level_bg_301",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 107094,
			say = "「広告カードを拾った者は廃工場の中に閉じ込められ、同じカードを3枚集めなければ脱出できない」……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 6,
			side = 2,
			bgName = "star_level_bg_301",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 107094,
			say = "ですが、私たちは工場ゲートの外にいます……つまり工場の中に入らなければ、そもそも閉じ込められることはありませんが……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 2,
			side = 2,
			bgName = "star_level_bg_301",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 102360,
			say = "じゃあ入りますか……？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 101580,
			side = 0,
			bgName = "star_level_bg_301",
			actorName = "二人",
			dir = 1,
			hideOther = true,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "もちろん入らないよ！ もちろん入るよ～",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			subActors = {
				{
					expression = 5,
					actor = 900479,
					paintingNoise = false,
					hidePaintObj = false,
					dir = 1,
					pos = {
						x = 1125,
						y = 0
					}
				}
			}
		},
		{
			expression = 2,
			side = 2,
			bgName = "star_level_bg_301",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 101580,
			say = "えええ！！？なんで入るの！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 5,
			side = 2,
			bgName = "star_level_bg_301",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 900479,
			say = "だって面白そうじゃない。それに、ぼくたちが受けた依頼はこの異常現象を解決することだよ",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 1,
			side = 2,
			bgName = "star_level_bg_301",
			paintingNoise = true,
			dir = 1,
			actor = 101560,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "……門の近くに案内標識があるみたい。何か手がかりがあるかも",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 3,
			side = 2,
			bgName = "star_level_bg_301",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 107200,
			say = "案内標識？ちょっと見てくる～",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 107200,
			side = 2,
			bgName = "star_level_bg_301",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			say = "あったよ！",
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
			bgName = "star_level_bg_301",
			hidePaintObj = true,
			side = 2,
			portrait = "zhihuiguan",
			say = "――何て書いてある？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 2,
			side = 2,
			bgName = "star_level_bg_301",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 107200,
			say = "「休業日、現在閉鎖中、お引き取りください」って……はぁ？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 2,
			side = 2,
			bgName = "star_level_bg_301",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 107094,
			say = "……？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 2,
			side = 2,
			bgName = "star_level_bg_301",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 102360,
			say = "えぇ……？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			nameColor = "#A9F548FF",
			bgName = "star_level_bg_301",
			hidePaintObj = true,
			side = 2,
			portrait = "zhihuiguan",
			say = "――都市の異常現象に休業日が存在するのか？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 2,
			side = 2,
			bgName = "star_level_bg_301",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 101580,
			say = "この前のバイトは無休だったのに！許せない！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 900479,
			side = 2,
			bgName = "star_level_bg_301",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			say = "おーい！誰かいませんかー？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "star_level_bg_301",
			hidePaintObj = true,
			say = "リシャールは閉ざされた工場ゲートの前まで歩み寄り、力強く叩いた。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "star_level_bg_301",
			hidePaintObj = true,
			say = "3回ノックすると、廃工場のゲートが轟音とともに崩れ落ちた。",
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
			bgName = "star_level_bg_301",
			hidePaintObj = true,
			say = "続いては外壁、そして連鎖反応が起きたように工場内のすべての物が次々と崩壊していった。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "star_level_bg_301",
			hidePaintObj = true,
			say = "わずか30秒ほどで、廃工場は瓦礫と化し、そのまま消え去ってしまった。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 6,
			side = 2,
			bgName = "star_level_bg_301",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 900479,
			say = "あれ……？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 2,
			side = 2,
			bgName = "star_level_bg_301",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 102360,
			say = "いったい何が起きたんです？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 3,
			side = 2,
			bgName = "star_level_bg_301",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 107200,
			say = "ふぅ……カメラを回しっぱなしにしといてよかったぁ！今のは最高の素材になるよ！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 2,
			side = 2,
			bgName = "star_level_bg_301",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 107094,
			say = "あの崩壊の仕方、強い外力による衝撃を受けて完全に瓦解したように見えますけど……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			nameColor = "#A9F548FF",
			bgName = "star_level_bg_301",
			hidePaintObj = true,
			side = 2,
			portrait = "zhihuiguan",
			say = "――あっさり解決したな…",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 3,
			side = 2,
			bgName = "star_level_bg_301",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 101580,
			say = "さすがはスーパースターのボノム・リシャール……パワーまでも最強だった……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 6,
			side = 2,
			bgName = "star_level_bg_301",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 900479,
			say = "えっと……扉を軽くノックしただけなんだけど～",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 5,
			side = 2,
			bgName = "star_level_bg_301",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 900479,
			say = "ま、まぁ何が起きたかはさっぱりだけど、問題は解決できたみたいだしいっか～",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 5,
			side = 2,
			bgName = "star_level_bg_301",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 900479,
			say = "さぁ、依頼を報告して広告宣伝許可証を手に入れよう！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
