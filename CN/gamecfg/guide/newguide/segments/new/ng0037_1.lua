local var_0_0 = {
	"看来奖励是<color=#ff7d36>PT点数</color>",
	"<color=#ff7d36>PT点数</color>可以在商店里兑换大量奖励，接下来让我们去商店看看！",
	"真是丰富的奖励呢！指挥官请自由挑选~我先回港等你！"
}

return {
	id = "NG0037_1",
	events = {
		{
			alpha = 0.4,
			waitScene = "AwardInfoLayer",
			style = {
				dir = -1,
				mode = 2,
				posY = -341,
				posX = 431,
				text = var_0_0[1]
			},
			spriteui = {
				defaultName = "white_dot",
				path = "/OverlayCamera/Overlay/UIMain/AwardInfoUI(Clone)/items/items_scroll/content",
				childPath = "bg/icon_bg/icon",
				pathIndex = "#"
			},
			ui = {
				path = "OverlayCamera/Overlay/UIMain/AwardInfoUI(Clone)",
				pathIndex = -1,
				triggerType = {
					1
				},
				fingerPos = {
					posY = -172,
					posX = 520
				}
			}
		},
		{
			alpha = 0.4,
			style = {
				dir = -1,
				mode = 2,
				posY = -341,
				posX = 431,
				text = var_0_0[2]
			},
			ui = {
				path = "/UICamera/Canvas/UIMain/NewServerCarnivalUI(Clone)/left/frame/toggle_group/shop",
				triggerType = {
					2,
					true
				}
			}
		},
		{
			alpha = 0.4,
			style = {
				dir = -1,
				mode = 2,
				posX = 431,
				posY = -341,
				lineMode = true,
				text = var_0_0[3],
				uiset = {
					{
						path = "/UICamera/Canvas/UIMain/NewServerCarnivalUI(Clone)/main/shop_container",
						lineMode = 1
					}
				}
			}
		}
	}
}
