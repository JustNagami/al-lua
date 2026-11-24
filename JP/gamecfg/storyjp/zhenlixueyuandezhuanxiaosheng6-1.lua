return {
	id = "ZHENLIXUEYUANDEZHUANXIAOSHENG6-1",
	mode = 2,
	fadeOut = 1.5,
	scripts = {
		{
			NextIcon = 1,
			side = 2,
			bgName = "star_level_bg_311",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			say = "校舎の奥へ進んでいくと、低い唸り声が幾度も響いた。",
			bgm = "theme-hospitalnight-mystic",
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
				"真理学園・旧校舎",
				3
			}
		},
		{
			side = 2,
			NextIcon = 1,
			bgName = "star_level_bg_311",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			say = "――――！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 4,
			side = 2,
			bgName = "star_level_bg_311",
			NextIcon = 1,
			dir = 1,
			actor = 705110,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "今のは……一体……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			side = 2,
			NextIcon = 1,
			bgName = "star_level_bg_311",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			say = "廊下の突き当たりで、数体の奇妙な生き物がのろのろとうろついていた。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			bgName = "star_level_bg_311",
			mode = 1,
			sequence = {
				{
					"",
					0
				}
			},
			movableNode = {
				{
					time = 3,
					name = "katong_hangmu",
					spine = {
						action = "move",
						scale = 1.3
					},
					path = {
						{
							-1500,
							-200
						},
						{
							1800,
							-200
						}
					}
				},
				{
					delay = 0.4,
					name = "katong_zhongxun",
					time = 3,
					spine = {
						action = "move",
						scale = 1.3
					},
					path = {
						{
							-1600,
							-200
						},
						{
							1800,
							-200
						}
					}
				},
				{
					delay = 0.8,
					name = "katong_zhongxun",
					time = 3,
					spine = {
						action = "move",
						scale = 1.3
					},
					path = {
						{
							-1700,
							-400
						},
						{
							1800,
							-400
						}
					}
				},
				{
					delay = 1.2,
					name = "katong_zibao",
					time = 3,
					spine = {
						action = "move",
						scale = 1.3
					},
					path = {
						{
							-1800,
							-100
						},
						{
							1800,
							-100
						}
					}
				},
				{
					time = 3,
					name = "katong_zibao",
					spine = {
						action = "move",
						scale = 1.3
					},
					path = {
						{
							-1550,
							-200
						},
						{
							1800,
							-200
						}
					}
				},
				{
					delay = 2,
					name = "katong_zibao",
					time = 3,
					spine = {
						action = "move",
						scale = 1.3
					},
					path = {
						{
							-1650,
							0
						},
						{
							1800,
							0
						}
					}
				}
			}
		},
		{
			side = 2,
			nameColor = "#FF9B93",
			bgName = "star_level_bg_311",
			hidePaintObj = true,
			NextIcon = 1,
			actorName = "富？",
			say = "毎日金貨の山でスヤスヤ♪",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			movableNode = {
				{
					time = 1000,
					name = "katong_hangmu",
					spine = {
						action = "",
						scale = 1.3
					},
					path = {
						{
							0,
							-200
						},
						{
							0,
							-200
						}
					}
				}
			}
		},
		{
			side = 2,
			nameColor = "#FF9B93",
			bgName = "star_level_bg_311",
			hidePaintObj = true,
			NextIcon = 1,
			actorName = "甘味？",
			say = "キャンディは泉みたいに流れてきてサラサラ♪",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			movableNode = {
				{
					time = 1000,
					name = "katong_zibao",
					spine = {
						action = "",
						scale = 1.3
					},
					path = {
						{
							0,
							-200
						},
						{
							0,
							-200
						}
					}
				}
			}
		},
		{
			side = 2,
			nameColor = "#FF9B93",
			bgName = "star_level_bg_311",
			hidePaintObj = true,
			NextIcon = 1,
			actorName = "美味いもん？",
			say = "三食とも美味しい肉でジュルリ♪",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			movableNode = {
				{
					time = 1000,
					name = "katong_zhongxun",
					spine = {
						action = "",
						scale = 1.3
					},
					path = {
						{
							0,
							-200
						},
						{
							0,
							-200
						}
					}
				}
			}
		},
		{
			expression = 2,
			side = 2,
			bgName = "star_level_bg_311",
			NextIcon = 1,
			dir = 1,
			actor = 705110,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "あの怪物たち……キャンディでできてるの？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 6,
			side = 2,
			bgName = "star_level_bg_311",
			NextIcon = 1,
			dir = 1,
			actor = 702130,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "それに金貨と……ローストチキン？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			portrait = "zhihuiguan",
			side = 2,
			bgName = "star_level_bg_311",
			hidePaintObj = true,
			actor = 0,
			NextIcon = 1,
			nameColor = "#A9F548FF",
			say = "――こいつらが願いから生まれた怪物ってわけか",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 3,
			side = 2,
			bgName = "star_level_bg_311",
			NextIcon = 1,
			dir = 1,
			actor = 705110,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "幸せになりたくて願ったはずなのに、どうして誰かを傷つける怪物になってしまうのかしら……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			side = 2,
			NextIcon = 1,
			bgName = "star_level_bg_311",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			say = "次の瞬間、こっちの存在に気付いたのか、怪物たちは咆哮を上げて襲いかかってきた。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 702130,
			nameColor = "#A9F548FF",
			bgName = "star_level_bg_311",
			hidePaintObj = true,
			dir = 1,
			NextIcon = 1,
			side = 2,
			say = "大丈夫、先生があなたたちを守るわ",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 7,
			side = 2,
			bgName = "star_level_bg_311",
			NextIcon = 1,
			dir = 1,
			actor = 705100,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "普段はだらけてるように見えるかもだけど……いざ戦えばあたし、結構強いからね……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 8,
			side = 2,
			bgName = "star_level_bg_311",
			NextIcon = 1,
			dir = 1,
			actor = 705100,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "正確に言うと、あたしに仕える幽霊たち、なんだけどね",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
