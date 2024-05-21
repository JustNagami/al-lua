return {
	id = "ZHANFANGYUHUIGUANGZHICHENG5",
	mode = 2,
	fadeOut = 1.5,
	scripts = {
		{
			nameColor = "#5CE6FF",
			side = 2,
			bgName = "star_level_bg_592",
			hidePaintObj = true,
			say = "在我们离开后，卡美洛之庭就进入了隐匿模式。",
			bgm = "story-startravel",
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
			nameColor = "#5CE6FF",
			side = 2,
			bgName = "star_level_bg_592",
			hidePaintObj = true,
			say = "此刻，列车在无垠的星海中飞驰着。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#5CE6FF",
			side = 2,
			bgName = "star_level_bg_592",
			hidePaintObj = true,
			say = "遥远的群星纷繁闪耀，而我们所驶向的目的地，只有一片虚无。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 5,
			side = 2,
			bgName = "star_level_bg_592",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#FFC960",
			actor = 9705040,
			say = "就快到了。阿尔萨斯，你准备好了么？",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 8,
			side = 2,
			bgName = "star_level_bg_592",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#5CE6FF",
			actor = 805030,
			say = "大……大概！阿尔萨斯大概准备好了！",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 9705040,
			side = 2,
			bgName = "star_level_bg_592",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#FFC960",
			say = "很好。不用紧张，接下来就交给本王吧——",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#5CE6FF",
			side = 2,
			bgName = "star_level_bg_592",
			hidePaintObj = true,
			say = "时间，似乎在此刻停止了。",
			bgm = "theme-shallowoftheworld",
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
					name = "juqing_mengjing"
				}
			}
		},
		{
			nameColor = "#5CE6FF",
			side = 2,
			bgName = "star_level_bg_592",
			hidePaintObj = true,
			say = "车厢内的景象陡然静止，声音也停止了传播。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#5CE6FF",
			side = 2,
			bgName = "star_level_bg_592",
			hidePaintObj = true,
			say = "此刻，伊丽莎白女王·META似乎是唯一不受影响的人。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#5CE6FF",
			side = 2,
			bgName = "star_level_bg_592",
			hidePaintObj = true,
			say = "她缓步向着阿尔萨斯走去。每迈出一步，都在身后留下了一个自己的影子。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#5CE6FF",
			side = 2,
			bgName = "star_level_bg_592",
			hidePaintObj = true,
			say = "终于，她走到阿尔萨斯面前，然后身形径直穿过了她。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#5CE6FF",
			side = 2,
			bgName = "star_level_bg_592",
			hidePaintObj = true,
			say = "随后，时间开始重新流动。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#5CE6FF",
			side = 2,
			bgName = "star_level_bg_592",
			hidePaintObj = true,
			say = "所有的影子也伴随着流动的时间一同穿越阿尔萨斯，重叠在伊丽莎白女王·META身上之后消失了。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 5,
			side = 2,
			bgName = "star_level_bg_592",
			dir = 1,
			bgm = "story-lightheven-up",
			actor = 9705040,
			nameColor = "#FFC960",
			hidePaintObj = true,
			say = "——「审视」结束。",
			painting = {
				alpha = 0.3,
				time = 1
			},
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
					name = "juqing_mengjing"
				}
			}
		},
		{
			expression = 3,
			side = 2,
			bgName = "star_level_bg_592",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#FFC960",
			actor = 9705040,
			say = "辛苦了，可以不用再继续想了。",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 7,
			side = 2,
			bgName = "star_level_bg_592",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#5CE6FF",
			actor = 805030,
			say = "欸……已经结束了……？阿尔萨斯还什么都没做呢！",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 5,
			side = 2,
			bgName = "star_level_bg_592",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#FFC960",
			actor = 9705040,
			say = "不，你已经做得很好了。",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 5,
			side = 2,
			bgName = "star_level_bg_592",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#FFC960",
			actor = 9705040,
			say = "……有趣，没想到你是这么理解死亡的啊。",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 5,
			side = 2,
			bgName = "star_level_bg_592",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#5CE6FF",
			actor = 901050,
			say = "发生了什么事……伊丽莎白女士瞬间移动到了阿尔萨斯的身后？",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			action = {
				{
					type = "shake",
					y = 30,
					delay = 0,
					dur = 0.15,
					x = 0,
					number = 2
				}
			}
		},
		{
			expression = 5,
			side = 2,
			bgName = "star_level_bg_592",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#5CE6FF",
			actor = 901050,
			say = "你们有人看清楚她是怎么做到的么？！",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 6,
			side = 2,
			bgName = "star_level_bg_592",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#5CE6FF",
			actor = 901060,
			say = "没、没有……在一瞬间就过去了……",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 4,
			side = 2,
			bgName = "star_level_bg_592",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#5CE6FF",
			actor = 803020,
			say = "我也完全没有捕捉到那个移动的瞬间。",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 3,
			side = 2,
			bgName = "star_level_bg_592",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#5CE6FF",
			actor = 901070,
			say = "嗯…………有趣。",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 6,
			side = 2,
			bgName = "star_level_bg_592",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#5CE6FF",
			actor = 900430,
			say = "哼哼，现在知道伊丽莎白的厉害了吧~！",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			action = {
				{
					type = "shake",
					y = 30,
					delay = 0,
					dur = 0.15,
					x = 0,
					number = 2
				}
			}
		},
		{
			expression = 8,
			side = 2,
			bgName = "star_level_bg_592",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#5CE6FF",
			actor = 900430,
			say = "如果能抓到鲸鱼的话，我比伊丽莎白还要厉害哦~",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			side = 2,
			bgName = "star_level_bg_592",
			hidePaintObj = true,
			nameColor = "#5CE6FF",
			say = "（似乎只有我和D小姐观察到了“那一瞬间”里真正发生的事。）",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			side = 2,
			bgName = "star_level_bg_592",
			hidePaintObj = true,
			nameColor = "#5CE6FF",
			say = "（创造出了无数分身，然后径直穿越目标……当时在陆间海中，海洛芬特也做出了同样的事。）",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			side = 2,
			bgName = "star_level_bg_592",
			hidePaintObj = true,
			nameColor = "#5CE6FF",
			say = "（“审视”……难道是这个能力的名字？回头问问海伦娜好了。）",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 3,
			side = 2,
			bgName = "star_level_bg_592",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#5CE6FF",
			actor = 901050,
			say = "那接下来……我们应该做什么？",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 6,
			side = 2,
			bgName = "star_level_bg_592",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#5CE6FF",
			actor = 901050,
			say = "虽然你说已经处理完成了……但是外面好像什么事都没发生啊？",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 8,
			side = 2,
			bgName = "star_level_bg_592",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#5CE6FF",
			actor = 901060,
			say = "还是……空空一片……",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 5,
			side = 2,
			bgName = "star_level_bg_592",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#FFC960",
			actor = 9705040,
			say = "别急，那是因为本王还没开始操作呢。",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 3,
			side = 2,
			bgName = "star_level_bg_592",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#FFC960",
			actor = 9705040,
			say = "嗯——如此美丽的诠释，本王的车厢变换成此种景色倒也不错。",
			painting = {
				alpha = 0.3,
				time = 1
			},
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
			actor = 9705040,
			side = 2,
			bgName = "star_level_bg_592",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#FFC960",
			say = "概念转换——「七号车厢」，准备承载「死亡」，锚定不可见之物，让其在本王面前显形吧！",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			effects = {
				{
					active = false,
					name = "jinguang"
				},
				{
					active = false,
					name = "memoryFog"
				}
			}
		}
	}
}
