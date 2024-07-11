return {
	id = "AERSASI2",
	mode = 2,
	fadeOut = 1.5,
	scripts = {
		{
			stopbgm = true,
			mode = 1,
			sequence = {
				{
					"阿尔萨斯过热中！\n\n<size=45>二　秘书舰当然不在话下……？</size>",
					1
				}
			}
		},
		{
			fontsize = 39,
			side = 2,
			bgName = "bg_story_task_2",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			say = "在阿尔萨斯前来报到后，向她简单地说明了今天的工作。",
			bgm = "story-richang-5",
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
			expression = 5,
			side = 2,
			bgName = "bg_story_task_2",
			dir = 1,
			fontsize = 39,
			actor = 805030,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "阿尔萨斯明白了。指挥官就放心地交给阿尔萨斯吧。"
		},
		{
			expression = 3,
			side = 2,
			bgName = "bg_story_task_2",
			dir = 1,
			fontsize = 39,
			actor = 805030,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "哼~哼哼~♪"
		},
		{
			side = 2,
			nameColor = "#A9F548FF",
			bgName = "bg_story_task_2",
			hidePaintObj = true,
			say = "少女哼着自创的曲调，在属于自己的座位上坐下后，正式开始了她的工作。",
			fontsize = 39
		},
		{
			side = 2,
			nameColor = "#A9F548FF",
			bgName = "bg_story_task_2",
			hidePaintObj = true,
			say = "一段时间后——",
			fontsize = 39,
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
			side = 2,
			nameColor = "#A9F548FF",
			bgName = "bg_story_task_2",
			hidePaintObj = true,
			say = "阿尔萨斯将各类文件处理地井井有条，在她的协助下，工作效率确实提升了不少。",
			fontsize = 39
		},
		{
			actor = 0,
			nameColor = "#A9F548FF",
			bgName = "bg_story_task_2",
			hidePaintObj = true,
			side = 2,
			say = "（看来任命阿尔萨斯为秘书舰是个明智的决定。）",
			fontsize = 39
		},
		{
			actor = 0,
			nameColor = "#A9F548FF",
			bgName = "bg_story_task_2",
			hidePaintObj = true,
			side = 2,
			say = "（不过为了避免她在兴奋下努力过头……还是让她休息一下吧。）",
			fontsize = 39
		},
		{
			actor = 0,
			side = 2,
			bgName = "bg_story_task_2",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			say = "阿尔萨斯？差不多该休息一下了。",
			fontsize = 39,
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
			expression = 7,
			side = 2,
			bgName = "bg_story_task_2",
			dir = 1,
			fontsize = 39,
			actor = 805030,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "休、休息？阿尔萨斯现在是高效率秘书舰模式，完全不累不需要休息哦！"
		},
		{
			actor = 0,
			nameColor = "#A9F548FF",
			bgName = "bg_story_task_2",
			hidePaintObj = true,
			side = 2,
			say = "阿尔萨斯，上午的工作你已经出色地完成了。要注意劳逸结合，努力过头也不好。",
			fontsize = 39
		},
		{
			expression = 2,
			side = 2,
			bgName = "bg_story_task_2",
			dir = 1,
			fontsize = 39,
			actor = 805030,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "阿尔萨斯明白了。不、不过，指……指挥官这是……在夸、夸奖阿尔萨斯吗……？"
		},
		{
			expression = 8,
			side = 2,
			bgName = "bg_story_task_2",
			dir = 1,
			fontsize = 39,
			actor = 805030,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "像这样夸奖阿尔萨斯的话……情感模块会……啊啊……！",
			dialogShake = {
				speed = 0.08,
				x = 15,
				number = 2
			}
		},
		{
			side = 2,
			nameColor = "#A9F548FF",
			bgName = "bg_story_task_2",
			hidePaintObj = true,
			say = "在少女的自言自语中，指挥室中的温度骤然开始上升。",
			fontsize = 39
		},
		{
			actor = 0,
			nameColor = "#A9F548FF",
			bgName = "bg_story_task_2",
			hidePaintObj = true,
			side = 2,
			say = "阿尔萨斯……先冷静下来！",
			fontsize = 39
		},
		{
			expression = 7,
			side = 2,
			bgName = "bg_story_task_2",
			dir = 1,
			fontsize = 39,
			actor = 805030,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "对、对不起！阿尔萨斯要……先切断一下视觉和感知模块……"
		},
		{
			side = 2,
			nameColor = "#A9F548FF",
			bgName = "bg_story_task_2",
			hidePaintObj = true,
			say = "阿尔萨斯在说完后便低下头陷入了一段时间的沉默，指挥室内的温度也开始下降。",
			fontsize = 39,
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
			side = 2,
			nameColor = "#A9F548FF",
			bgName = "bg_story_task_2",
			hidePaintObj = true,
			say = "等到再度抬起头时，她的声音已经恢复了最初的镇定。",
			fontsize = 39
		},
		{
			expression = 6,
			side = 2,
			bgName = "bg_story_task_2",
			dir = 1,
			fontsize = 39,
			actor = 805030,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "抱歉，指挥官，刚刚是阿尔萨斯失态了。"
		},
		{
			expression = 1,
			side = 2,
			bgName = "bg_story_task_2",
			dir = 1,
			fontsize = 39,
			actor = 805030,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "作为道歉，阿尔萨斯这就去帮指挥官拿冰镇汽水过来。"
		},
		{
			side = 2,
			nameColor = "#A9F548FF",
			bgName = "bg_story_task_2",
			hidePaintObj = true,
			say = "说完后，阿尔萨斯便马上起身。等到她再回来时，手上已经多了一瓶冰汽水。",
			fontsize = 39
		},
		{
			actor = 0,
			nameColor = "#A9F548FF",
			bgName = "bg_story_task_2",
			hidePaintObj = true,
			side = 2,
			say = "谢谢。",
			fontsize = 39
		},
		{
			side = 2,
			nameColor = "#A9F548FF",
			bgName = "bg_story_task_2",
			hidePaintObj = true,
			say = "从少女手中接过汽水时，不知为何感受到了一股充满期待的视线……",
			fontsize = 39
		},
		{
			actor = 0,
			nameColor = "#A9F548FF",
			bgName = "bg_story_task_2",
			hidePaintObj = true,
			side = 2,
			say = "（嗯……？为什么隔着面具也能感受到阿尔萨斯的目光……？）",
			fontsize = 39
		},
		{
			side = 2,
			nameColor = "#A9F548FF",
			bgName = "bg_story_task_2",
			hidePaintObj = true,
			say = "出于这种奇妙的感受，忍不住仔细打量了一下戴着面具的阿尔萨斯。",
			fontsize = 39
		},
		{
			expression = 7,
			side = 2,
			bgName = "bg_story_task_2",
			dir = 1,
			fontsize = 39,
			actor = 805030,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "指、指挥官……指挥官看了阿尔萨斯……16秒……17秒……"
		},
		{
			actor = 0,
			nameColor = "#A9F548FF",
			bgName = "bg_story_task_2",
			hidePaintObj = true,
			side = 2,
			say = "阿尔萨斯……？",
			fontsize = 39
		},
		{
			expression = 8,
			side = 2,
			bgName = "bg_story_task_2",
			dir = 1,
			fontsize = 39,
			actor = 805030,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "不行不行不行不行……这种距离和强度……阿尔萨斯要……撑不住了！！？",
			dialogShake = {
				speed = 0.08,
				x = 15,
				number = 2
			}
		}
	}
}
