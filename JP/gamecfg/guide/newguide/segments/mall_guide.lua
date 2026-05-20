return {
	id = "MALL_GUIDE",
	events = {
		{
			is3dDorm = false,
			alpha = 0.4,
			style = {
				text = "指揮官、ゴールデンベイにようこそ！",
				mode = 1,
				dir = 1,
				char = "char",
				posY = 0,
				posX = 0,
				uiset = {}
			}
		},
		{
			is3dDorm = false,
			alpha = 0.4,
			style = {
				text = "ここをタップして、バカンスライフを楽しんでね！",
				mode = 2,
				dir = 1,
				char = "char",
				posY = 0,
				posX = 0,
				uiset = {
					{
						lineMode = 2,
						path = "UICamera/Canvas/UIMain/MallMapUI(Clone)/map/content/201",
						pathIndex = -1
					}
				}
			},
			ui = {
				path = "UICamera/Canvas/UIMain/MallMapUI(Clone)/map/content/201",
				pathIndex = -1
			}
		}
	}
}
