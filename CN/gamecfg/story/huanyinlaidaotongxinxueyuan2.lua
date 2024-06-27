return {
	id = "HUANYINLAIDAOTONGXINXUEYUAN2",
	mode = 2,
	fadeOut = 1.5,
	scripts = {
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "bg_story_task",
			hidePaintObj = true,
			say = "童心学院·童趣艺体楼",
			bgm = "story-darkplan",
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
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "bg_story_task",
			hidePaintObj = true,
			say = "空荡的走廊中，只有风声作响，往复不停。墙上装饰用的音符松动，堪堪挂住，轻轻晃动。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "bg_story_task",
			hidePaintObj = true,
			say = "嘎吱——",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 6,
			side = 2,
			bgName = "bg_story_task",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 401431,
			say = "呜哇！怎、怎怎怎么回事！这个声音好奇怪！该不会是踩到陷阱了吧！指挥官，救、救我！",
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
			expression = 2,
			side = 2,
			bgName = "bg_story_task",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 102210,
			say = "只是踩到坏掉的地板而已啦！",
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
			bgName = "bg_story_task",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 101266,
			say = "……地上，埃尔德里奇，有发现。",
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
			bgName = "bg_story_task",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 408131,
			say = "真的欸~指挥官你能看到吗？需要我把设备的角度调整一下吗~",
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
			bgName = "bg_story_task",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 408131,
			say = "还是说，指挥官只想看着可爱的{namecode:536:U-31}呢~？",
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
			bgName = "bg_story_task",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 307130,
			say = "你这家伙……快点给我进入正题啦！",
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
			bgName = "bg_story_task",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 408131,
			say = "哎呀，有人着急了呢~",
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
			bgName = "bg_story_task",
			factiontag = "通讯模式",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			say = "……{namecode:536:U-31}，你把镜头调整一下，让我看看地上的东西。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 408131,
			side = 2,
			bgName = "bg_story_task",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			say = "好~",
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
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "bg_story_task",
			hidePaintObj = true,
			say = "从镜头中可以看到，地上散落着被人粗暴地撕下来的报纸标题大字——“保护”，“深夜”，“失踪”。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 4,
			side = 2,
			bgName = "bg_story_task",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 102210,
			say = "难道是那个传闻……出发前布里斯托尔告诉我的……“因未被妥善保护，神秘生灵于深夜失踪”！！",
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
			expression = 0,
			side = 2,
			bgName = "bg_story_task",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 401431,
			say = "不不不，一定是失踪的命运堕天使，为保护光明，堕入无尽的黑……不对！无尽的深夜！",
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
			bgName = "bg_story_task",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 408131,
			say = "你们说的哪一种传闻都没听说过啦！",
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
			actor = 101266,
			side = 2,
			bgName = "bg_story_task",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			say = "……嘘。音乐声，发现。",
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
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "bg_story_task",
			hidePaintObj = true,
			say = "众人纷纷安静了下来，集中精神聆听，轻快又欢乐的曲调回荡在楼内，显得格外诡异。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 4,
			side = 2,
			bgName = "bg_story_task",
			paintingNoise = true,
			dir = 1,
			actor = 102160,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "指挥官，经过对比建筑结构图，声音来源的房间应该是这条走廊尽头的音乐教室。",
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
			bgName = "bg_story_task",
			factiontag = "通讯模式",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			say = "看来解决艺体楼的异常的关键就在那里了。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			side = 2,
			bgName = "bg_story_task",
			factiontag = "通讯模式",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			say = "闪耀星星小队，准备前去调查。注意安全。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			side = 2,
			actorName = "众人",
			bgName = "bg_story_task",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			say = "明白——",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "star_level_bg_599",
			hidePaintObj = true,
			say = "童趣艺体楼·音乐教室",
			bgm = "story-richang-11",
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
			bgName = "star_level_bg_599",
			hidePaintObj = true,
			say = "砰——！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			dialogShake = {
				speed = 0.08,
				x = 15,
				number = 2
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "star_level_bg_599",
			hidePaintObj = true,
			say = "随着闪耀星星小队破门而入，映入眼帘的是一幅奇妙的光景。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 1,
			side = 2,
			bgName = "star_level_bg_599",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 307140,
			say = "欸~？你们来啦~都来陪妾身玩吧，妾身现在可是精神得不得了哦！",
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
			bgName = "star_level_bg_599",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 403120,
			say = "好无聊……提不起劲啊……不想吃点心……也不想看书……",
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
			expression = 1,
			side = 2,
			bgName = "star_level_bg_599",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 102190,
			say = "发型也没什么好在意的吧，就这样散着就好了……",
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
			bgName = "star_level_bg_599",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 405060,
			say = "乐章……不想去演奏了……呼呼……没有音乐也好。",
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
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "star_level_bg_599",
			hidePaintObj = true,
			say = "伴随着音乐的旋律，教室中的学生们正慵懒地蹲坐在房间各处。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 4,
			side = 2,
			bgName = "star_level_bg_599",
			paintingNoise = true,
			dir = 1,
			actor = 102050,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "指挥官，音乐教室内……似乎存在某种干涉精神的污染源，教室中的学生已经受到影响了。",
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
			bgName = "star_level_bg_599",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 408131,
			say = "哪有什么奇怪的孩子……保护指挥官的安全什么的好麻烦哦，就在这里休息吧……",
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
			expression = 2,
			side = 2,
			bgName = "star_level_bg_599",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 102210,
			say = "我不想当闪耀的星星了……帮上指挥官的忙也没什么用吧……",
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
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "star_level_bg_599",
			hidePaintObj = true,
			say = "埃尔德里奇什么都没说，只是默默放下了手中的探测棍，在角落里双手抱膝，坐到了地上。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 2,
			side = 2,
			bgName = "star_level_bg_599",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 401431,
			say = "……欸？指、指挥官！你看到了吗！大家都变得好奇怪！",
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
			paintingNoise = true,
			side = 2,
			bgName = "star_level_bg_599",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 112010,
			say = "糟糕，污染源的强度超出预期，闪耀星星小队的成员已经受到影响了。",
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
			paintingNoise = true,
			side = 2,
			bgName = "star_level_bg_599",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 112010,
			say = "指挥官，我建议立刻让幸存的小队成员撤离并派遣救援人员。",
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
			expression = 2,
			side = 2,
			bgName = "star_level_bg_599",
			paintingNoise = true,
			dir = 1,
			actor = 405010,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "来不及了，直接摧毁教室内的干扰源是更快的手段。",
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
			bgName = "star_level_bg_599",
			factiontag = "通讯模式",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			say = "干扰源……对了，{namecode:537:Z43}，你对于自己没受到影响有什么头绪么？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 1,
			side = 2,
			bgName = "star_level_bg_599",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 401431,
			say = "难、难道是因为吾提前塞住了耳朵……？因为吾进来时担心有恶咒迎面袭击……",
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
			bgName = "star_level_bg_599",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			say = "（看来这些音乐声就是干涉精神的原因。）",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			side = 2,
			bgName = "star_level_bg_599",
			factiontag = "通讯模式",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			say = "{namecode:537:Z43}，你继续捂住耳朵，然后观察周围，能找到音乐出现的源头么？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 4,
			side = 2,
			bgName = "star_level_bg_599",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 401431,
			say = "吾发现了几台音响！难道它们就是邪恶力量的源头？",
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
			bgName = "star_level_bg_599",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 401431,
			say = "需要吾将其破坏掉吗？！",
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
			bgName = "star_level_bg_599",
			factiontag = "通讯模式",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			say = "嗯，只要想办法让音乐停下来，大家应该就能恢复正常了！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 6,
			side = 2,
			bgName = "star_level_bg_599",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 401431,
			say = "唔唔唔……够不着啊……又不能在教室里开炮……",
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
			}
		},
		{
			expression = 6,
			side = 2,
			bgName = "star_level_bg_599",
			paintingNoise = true,
			dir = 1,
			actor = 608020,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "听我说，或许不用破坏音响也能达成目的！",
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
			bgName = "star_level_bg_599",
			paintingNoise = true,
			dir = 1,
			actor = 608020,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "既然现在的音乐旋律是造成精神影响的原因，那只要破坏这个旋律本身就好了！",
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
			bgName = "star_level_bg_599",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			say = "（破坏旋律……音乐教室内倒是有的是乐器。）",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			side = 2,
			bgName = "star_level_bg_599",
			factiontag = "通讯模式",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			say = "{namecode:537:Z43}你会演奏什么乐器么？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 6,
			side = 2,
			bgName = "star_level_bg_599",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 401431,
			say = "那种事情吾不会啦——！哇啊啊啊，小{namecode:182:信浓}，你不要扑上来呀！万一摔倒了会很痛的！",
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
			bgName = "star_level_bg_599",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 307140,
			say = "妾身听见了指挥官的声音~！妾身要和指挥官一起玩~！",
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
			bgName = "star_level_bg_599",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 401431,
			say = "等会儿，等会儿！小{namecode:182:信浓}，你先在这里坐一会儿，指挥官马上就到！",
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
			bgName = "star_level_bg_599",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 401431,
			say = "总之只要能打乱现在这个音乐，就可以了！对吧！",
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
			expression = 4,
			side = 2,
			bgName = "star_level_bg_599",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 401431,
			say = "……这间教室里有音响和麦克风。汝放心吧，堕入深渊的大家，吾来拯救！",
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
			bgName = "star_level_bg_599",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 401431,
			say = "咳咳——！",
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
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "star_level_bg_599",
			hidePaintObj = true,
			say = "{namecode:537:Z43}清了清嗓子，举起了连接着音响的麦克风。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 6,
			side = 2,
			bgName = "star_level_bg_599",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 401431,
			say = "漆黑烈火之翼♪~签下契约之时♪~封印解除♪~啦啦啦♪~",
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
		}
	}
}
