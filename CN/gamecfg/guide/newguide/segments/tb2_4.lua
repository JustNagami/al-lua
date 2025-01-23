return {
	id = "tb2_4",
	events = {
		{
			is3dDorm = false,
			alpha = 0.4,
			style = {
				text = "像这样，完成日常交流可提升与娜比娅的好感度",
				mode = 2,
				dir = 1,
				char = 1,
				posY = 0,
				posX = 0,
				uiset = {
					{
						lineMode = 1,
						path = "UICamera/Canvas/UIMain/NewEducateMainUI(Clone)/root/adapt/favor",
						pathIndex = -1
					}
				}
			},
			ui = {
				path = "UICamera/Canvas/UIMain/NewEducateMainUI(Clone)/root/adapt/favor",
				pathIndex = -1
			}
		},
		{
			is3dDorm = false,
			delay = 0.5,
			alpha = 0.4,
			style = {
				text = "点击此处可确认当前好感度等级",
				mode = 2,
				dir = 1,
				char = 1,
				posY = 0,
				posX = 0,
				uiset = {
					{
						lineMode = 2,
						path = "OverlayCamera/Overlay/UIMain/NewEducateFavorPanel(Clone)/favor_panel/panel",
						pathIndex = -1
					}
				}
			}
		},
		{
			is3dDorm = false,
			delay = 0.5,
			alpha = 0.4,
			style = {
				text = "此后每升一级，都可以获取额外奖励",
				mode = 2,
				dir = 1,
				char = 1,
				posY = 0,
				posX = 0,
				uiset = {}
			}
		},
		{
			is3dDorm = false,
			alpha = 0.4,
			style = {
				text = "现在，请点击空白处关闭弹窗吧",
				mode = 2,
				dir = 1,
				char = 1,
				posY = 0,
				posX = 0,
				uiset = {}
			},
			ui = {
				path = "OverlayCamera/Overlay/UIMain/NewEducateFavorPanel(Clone)/favor_panel",
				pathIndex = -1,
				fingerPos = {
					posY = 0,
					posX = 400
				}
			}
		}
	}
}
