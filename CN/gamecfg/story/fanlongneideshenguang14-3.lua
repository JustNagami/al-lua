return {
	id = "FANLONGNEIDESHENGUANG14-3",
	mode = 2,
	fadeOut = 1.5,
	scripts = {
		{
			bgm = "battle-shenguang-freely",
			side = 2,
			bgName = "star_level_bg_307",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			say = "轰——————！",
			soundeffect = "event:/battle/boom2",
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
			flashN = {
				color = {
					1,
					1,
					1,
					1
				},
				alpha = {
					{
						0,
						1,
						0.2,
						0
					},
					{
						1,
						0,
						0.2,
						0.2
					},
					{
						0,
						1,
						0.2,
						0.4
					},
					{
						1,
						0,
						0.2,
						0.6
					}
				}
			},
			dialogShake = {
				speed = 0.09,
				x = 8.5,
				number = 2
			}
		},
		{
			expression = 7,
			side = 2,
			bgName = "star_level_bg_307",
			factiontag = "佛罗伦萨共和国",
			dir = 1,
			actor = 605080,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "啊哈哈哈——感受艺术的力量吧☆",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 1,
			side = 2,
			bgName = "star_level_bg_307",
			factiontag = "佛罗伦萨共和国",
			actor = 601110,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "集中火力，先拿下一个人！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			side = 2,
			nameColor = "#A9F548FF",
			bgName = "star_level_bg_307",
			hidePaintObj = true,
			say = "轰——————！",
			soundeffect = "event:/battle/boom2",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			flashN = {
				color = {
					1,
					1,
					1,
					1
				},
				alpha = {
					{
						0,
						1,
						0.2,
						0
					},
					{
						1,
						0,
						0.2,
						0.2
					},
					{
						0,
						1,
						0.2,
						0.4
					},
					{
						1,
						0,
						0.2,
						0.6
					}
				}
			},
			dialogShake = {
				speed = 0.09,
				x = 8.5,
				number = 2
			}
		},
		{
			actor = 9703010,
			side = 2,
			bgName = "star_level_bg_307",
			factiontag = "威尼斯共和国",
			dir = 1,
			nameColor = "#FFC960",
			hidePaintObj = true,
			say = "没想到，我们竟然会落入下风……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 9703060,
			side = 2,
			bgName = "star_level_bg_307",
			factiontag = "威尼斯共和国",
			dir = 1,
			nameColor = "#FFC960",
			hidePaintObj = true,
			say = "临时决定的阻击计划，确实难以周全。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 9703060,
			side = 2,
			bgName = "star_level_bg_307",
			factiontag = "威尼斯共和国",
			dir = 1,
			nameColor = "#FFC960",
			hidePaintObj = true,
			say = "我们已经没有取胜的可能了，不必继续纠缠。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 9703010,
			side = 2,
			bgName = "star_level_bg_307",
			factiontag = "威尼斯共和国",
			dir = 1,
			nameColor = "#FFC960",
			hidePaintObj = true,
			say = "哎——也只能放弃这次斩首的机会了。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 9703010,
			side = 2,
			bgName = "star_level_bg_307",
			factiontag = "威尼斯共和国",
			dir = 1,
			nameColor = "#FFC960",
			hidePaintObj = true,
			say = "圣座冕下，我们正面战场上见。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			action = {
				{
					type = "move",
					y = 0,
					delay = 1,
					dur = 1,
					x = 2500
				}
			}
		},
		{
			expression = 6,
			side = 2,
			bgName = "star_level_bg_307",
			factiontag = "撒丁教国",
			dir = 1,
			actor = 699010,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "哎，别走啊，帮我给你们老大带个话——！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 5,
			side = 2,
			bgName = "star_level_bg_307",
			factiontag = "撒丁教国",
			dir = 1,
			actor = 699010,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "……跑得倒挺快。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 3,
			side = 2,
			bgName = "star_level_bg_307",
			factiontag = "佛罗伦萨共和国",
			dir = 1,
			actor = 608020,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "快追快追，别让她们跑了！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 601110,
			side = 2,
			bgName = "star_level_bg_307",
			factiontag = "佛罗伦萨共和国",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			say = "圣座冕下，不可。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 699010,
			side = 2,
			bgName = "star_level_bg_307",
			factiontag = "撒丁教国",
			dir = 1,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "本圣座知道，追她们做什么？跑去另一个伏击圈自投罗网么？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 1,
			side = 2,
			bgName = "star_level_bg_307",
			factiontag = "撒丁教国",
			dir = 1,
			actor = 699010,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "她们说正面战场……恐怕全面战争已经开始了",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 5,
			side = 2,
			bgName = "star_level_bg_307",
			factiontag = "撒丁教国",
			dir = 1,
			actor = 699010,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "当务之急是返回罗马主持大局，整队出发！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
