return {
	id = "YOUYINGMICHENG20",
	mode = 2,
	fadeOut = 1.5,
	scripts = {
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "star_level_bg_170",
			actorName = "ある普通の後方要員",
			bgm = "story-nonightcity",
			actor = 317030,
			NextIcon = 1,
			hidePaintObj = true,
			say = "助かった……",
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
			location = {
				"飛行艇・コントロールルーム",
				3
			}
		},
		{
			expression = 3,
			side = 2,
			bgName = "star_level_bg_170",
			factiontag = "妖異エージェント",
			dir = 1,
			NextIcon = 1,
			actor = 900557,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "助かった……って違う！あなた、一体いつの間に紛れ込んでたのよ！",
			actorPosition = {
				x = -200,
				y = 0
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 4,
			side = 2,
			bgName = "star_level_bg_170",
			actorName = "ある普通の後方要員",
			NextIcon = 1,
			actor = 317030,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "うーん……さぁ？よく覚えてない……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 3,
			side = 2,
			bgName = "star_level_bg_170",
			actorName = "ある普通の後方要員",
			NextIcon = 1,
			actor = 317030,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "そうだ…天城ちゃん、操縦を手伝わせてもらっても？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			side = 2,
			NextIcon = 1,
			bgName = "star_level_bg_529",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			say = "飛行艇が雲を抜けると、眼下にはランドマークとなる研究塔を擁する、真っ白な都市が広がった。",
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
			side = 2,
			NextIcon = 1,
			bgName = "star_level_bg_529",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			say = "他の都市とは違いNO.1は一面が明るく、空気も澄んでいた。妖異の攻撃を受けた様子も見当たらない。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 1,
			side = 2,
			bgName = "star_level_bg_529",
			factiontag = "NO.1支援者",
			dir = 1,
			NextIcon = 1,
			actor = 304070,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "皆さん……ようこそ、新紀元シティNO.1へ",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 5,
			side = 2,
			bgName = "star_level_bg_529",
			NextIcon = 1,
			dir = 1,
			actor = 900557,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "……ん、なにこれ……今、ちょっとクラッとした気が……",
			actorPosition = {
				x = -200,
				y = 0
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 6,
			side = 2,
			bgName = "star_level_bg_529",
			factiontag = "NO.1支援者",
			dir = 1,
			NextIcon = 1,
			actor = 304070,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "指揮官と行動を共にしている妖異の皆さんには、特別に権限を申請しておきました……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			NextIcon = 1,
			side = 2,
			bgName = "star_level_bg_529",
			factiontag = "NO.1支援者",
			dir = 1,
			actor = 304070,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "でも……やはり少しばかり不調をきたしているみたいですね……皆さん、もう少し我慢してくださいませ……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 6,
			side = 2,
			bgName = "star_level_bg_529",
			factiontag = "NO.1支援者",
			dir = 1,
			NextIcon = 1,
			actor = 304070,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "ふぅ、それでは……いよいよ着陸です",
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
			bgName = "star_level_bg_529",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			say = "飛行艇がプラットフォームに着陸したその瞬間、張りつめていた天城ちゃんは力が抜け、そのまま後ろへ倒れ込んだ。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			options = {
				{
					content = "天城ちゃんを受け止める",
					flag = 1
				}
			}
		},
		{
			expression = 4,
			side = 2,
			bgName = "star_level_bg_529",
			factiontag = "NO.1支援者",
			dir = 1,
			NextIcon = 1,
			actor = 304070,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "……げほげほ……ごめんなさい。あまり激しい戦闘には向いていなくて…",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			portrait = "zhihuiguan",
			side = 2,
			bgName = "star_level_bg_529",
			hidePaintObj = true,
			actor = 0,
			NextIcon = 1,
			nameColor = "#A9F548FF",
			say = "――お疲れさま。あとはこっちに任せて",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			side = 2,
			NextIcon = 1,
			bgName = "star_level_bg_529",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			say = "疲れきった天城ちゃんはこっちの腕に身を預けると、ほどなくして眠りについた。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 7,
			side = 2,
			bgName = "star_level_bg_529",
			factiontag = "新人エージェント",
			dir = 1,
			NextIcon = 1,
			actor = 231211,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "ずっと気を張っていたんですね……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			side = 2,
			NextIcon = 1,
			bgName = "star_level_bg_529",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			say = "そのときハッチが開き、そこからメイド服の女の子が入ってきて、可愛らしいカーテシーを見せた。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			NextIcon = 1,
			side = 2,
			bgName = "star_level_bg_529",
			factiontag = "NO.1事務官",
			dir = 1,
			actor = 202180,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "こんにちは、事務官のベルファストと申します。天城ちゃんのことはどうか私たちにお任せくださいませ",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			portrait = "zhihuiguan",
			side = 2,
			bgName = "star_level_bg_529",
			hidePaintObj = true,
			actor = 0,
			NextIcon = 1,
			nameColor = "#A9F548FF",
			say = "――お願いするよ",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			side = 2,
			NextIcon = 1,
			bgName = "star_level_bg_529",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			say = "ベルちゃんが天城ちゃんを後方へ送り届けるのを見送った後、遠くから不意に心地よい旋律が流れてきた。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 2,
			side = 2,
			bgName = "star_level_bg_529",
			factiontag = "妖異",
			dir = 1,
			NextIcon = 1,
			actor = 202380,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "……変わった旋律ね",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 7,
			side = 2,
			bgName = "star_level_bg_529",
			factiontag = "妖異",
			dir = 1,
			NextIcon = 1,
			actor = 202380,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "感じるわ……この旋律は、人の心の奥に眠る……ある種の特質を呼び覚ますみたい",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			side = 2,
			NextIcon = 1,
			bgName = "star_level_bg_529",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			say = "音のする方へ目を向けると、青く光る波動が幾重にも広がり、研究塔を中心に都市全体へと広がっていく。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			NextIcon = 1,
			side = 2,
			bgName = "star_level_bg_529",
			factiontag = "NO.1特使",
			dir = 1,
			actor = 102200,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "あれは「新紀元リセット装置」、幸福都市計画の要だ！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			NextIcon = 1,
			side = 2,
			bgName = "star_level_bg_529",
			factiontag = "NO.1特使",
			dir = 1,
			actor = 102200,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "初めて見たみたいな顔をしないでくれよ？NO.7の市庁舎の前にだって、この装置の簡易型があるんだから",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			side = 2,
			NextIcon = 1,
			bgName = "star_level_bg_529",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			say = "ベルちゃんに続き、今度は以前NO.7に来たNO.1の特使、クリーブランドが現れた。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			side = 2,
			NextIcon = 1,
			bgName = "star_level_bg_529",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			say = "……いや、「小さくなった」クリーブランドか？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			NextIcon = 1,
			side = 2,
			bgName = "star_level_bg_529",
			factiontag = "妖異エージェント",
			dir = 1,
			actor = 900557,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "ちっちゃ！？あなた、背が縮んだ！？",
			actorPosition = {
				x = -200,
				y = 0
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 1,
			side = 2,
			bgName = "star_level_bg_529",
			factiontag = "NO.1特使",
			dir = 1,
			NextIcon = 1,
			actor = 102200,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "わわ、見た目で判断するなって！ちょっと前より背が縮んだだけで、大して変わってないだろ？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			NextIcon = 1,
			side = 2,
			bgName = "star_level_bg_529",
			factiontag = "NO.1特使",
			dir = 1,
			actor = 102200,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "とにかく、あの研究塔にあるリセット装置のおかげで妖異の大侵攻があっても、ここは安定を保てるってわけさ",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 6,
			side = 2,
			bgName = "star_level_bg_529",
			factiontag = "妖異",
			dir = 1,
			NextIcon = 1,
			actor = 202380,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "でも……それには、代償があるのよね？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			NextIcon = 1,
			side = 2,
			bgName = "star_level_bg_529",
			factiontag = "NO.1特使",
			dir = 1,
			actor = 102200,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "……まあ、あるにはあるよ？詳しいことはあとで誰かが説明してくれるから！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 1,
			side = 2,
			bgName = "star_level_bg_529",
			factiontag = "NO.1特使",
			dir = 1,
			NextIcon = 1,
			actor = 102200,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "それよりも指揮官、ついてきて！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			NextIcon = 1,
			side = 2,
			bgName = "star_level_bg_529",
			factiontag = "NO.1特使",
			dir = 1,
			actor = 102200,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "八人議会のみんなが待ってるぞ",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			side = 2,
			NextIcon = 1,
			bgName = "star_level_bg_529",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			say = "タイガーは勝手に先導していくリトル・クリーブランドの背中を見つめながら、どこか読めない表情を浮かべていた。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			side = 2,
			NextIcon = 1,
			bgName = "star_level_bg_529",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			say = "だが、窓の外の通りに何か面白いものでも見つけたようで、自分に軽く手を振った。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			side = 2,
			NextIcon = 1,
			bgName = "star_level_bg_704",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			say = "通りには人々が行き交い、戦時のような重苦しさはどこにも感じられなかった。",
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
			actor = 102210,
			nameColor = "#A9F548FF",
			bgName = "star_level_bg_704",
			hidePaintObj = true,
			dir = 1,
			NextIcon = 1,
			side = 2,
			say = "フォーミダブル聞いてよ……頭のいいサンディエゴ、面白いことに気づいた！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 4,
			side = 2,
			bgName = "star_level_bg_704",
			NextIcon = 1,
			dir = 1,
			actor = 102210,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "もしかして……この研究塔って、本当は超おっきな防御塔でもあったりして？！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 207130,
			nameColor = "#A9F548FF",
			bgName = "star_level_bg_704",
			hidePaintObj = true,
			dir = 1,
			NextIcon = 1,
			side = 2,
			say = "うーん……その可能性もあるかも？でも、そういうのってどうやって確かめれば……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 1,
			side = 2,
			bgName = "star_level_bg_704",
			NextIcon = 1,
			dir = 1,
			actor = 102210,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "簡単だよ！ただ……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			side = 2,
			NextIcon = 1,
			bgName = "star_level_bg_704",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			say = "リトル・サンディエゴは雪だるまマーク？のレモネードを取り出すと、研究塔の方を向きながら飲み始めた。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			portrait = "zhihuiguan",
			side = 2,
			bgName = "star_level_bg_704",
			hidePaintObj = true,
			actor = 0,
			NextIcon = 1,
			nameColor = "#A9F548FF",
			say = "………………",
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
			expression = 6,
			side = 2,
			bgName = "star_level_bg_704",
			factiontag = "妖異",
			dir = 1,
			NextIcon = 1,
			actor = 202380,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "指揮官さんも気づいたでしょう？ここ、なにかおかしいわ",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 6,
			side = 2,
			bgName = "star_level_bg_704",
			factiontag = "妖異",
			dir = 1,
			NextIcon = 1,
			actor = 202380,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "ベルファスト、天城、クリーブランド、ここに暮らすみんな……外で起きてることを全然気にも留めていないみたい",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 9,
			side = 2,
			bgName = "star_level_bg_704",
			factiontag = "妖異",
			dir = 1,
			NextIcon = 1,
			actor = 202380,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "それに、どうしてみんな――子どもの姿をしているのかしら？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
