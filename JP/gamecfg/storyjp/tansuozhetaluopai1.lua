return {
	id = "TANSUOZHETALUOPAI1",
	mode = 2,
	fadeOut = 1.5,
	scripts = {
		{
			actor = 807020,
			side = 2,
			bgName = "bg_story_task_2",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			say = "指揮官、この前話した、私が設計に参加した新しい仕掛けのこと……覚えてます？",
			bgm = "story-richang-1",
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
				"母港・執務室",
				3
			}
		},
		{
			expression = 1,
			side = 2,
			bgName = "bg_story_task_2",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 807020,
			say = "今こそ、その仕掛けを検証する絶好の機会だと思います",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 807020,
			side = 2,
			bgName = "bg_story_task_2",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			say = "指揮官、この3枚のタロットカードをローラーちゃんに渡してください",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 1,
			side = 2,
			bgName = "bg_story_task_2",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 807020,
			say = "願わくば、二人に幸ある愉快な旅があらんことを",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 1,
			side = 2,
			bgName = "bg_story_task_2",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 807020,
			say = "未来を変えるきっかけは……選ばれたカードに宿っているかもしれません",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
