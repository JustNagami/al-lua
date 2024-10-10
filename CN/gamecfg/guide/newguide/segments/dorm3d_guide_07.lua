return {
	id = "DORM3D_GUIDE_07",
	events = {
		{
			is3dDorm = true,
			delay = 0.5,
			alpha = 0.4,
			style = {
				text = "点击此处，打开契合度面板",
				mode = 4,
				dir = 1,
				char = "char",
				posY = 350,
				posX = 650,
				uiset = {}
			},
			ui = {
				path = "UICamera/Canvas/UIMain/Dorm3dMainUI(Clone)/UI/base/top/favor_level",
				pathIndex = -1
			}
		},
		{
			is3dDorm = true,
			delay = 0.8,
			alpha = 0.4,
			style = {
				text = "点击此处，打开昼夜切换界面",
				mode = 4,
				dir = 1,
				char = "char",
				posY = -450,
				posX = -450,
				uiset = {
					{
						lineMode = 2,
						path = "UICamera/Canvas/UIMain/Dorm3dLevelUI(Clone)/panel",
						pathIndex = -1
					}
				}
			},
			ui = {
				path = "UICamera/Canvas/UIMain/Dorm3dLevelUI(Clone)/panel/bg/bottom/btn_time",
				pathIndex = -1,
				fingerPos = {
					posY = -40,
					posX = 65
				}
			}
		},
		{
			delay = 0.2,
			is3dDorm = false,
			alpha = 0.4,
			style = {
				text = "点选后即可切换时间。在夜间，宿舍的物品摆设也会略有不同哦~",
				mode = 4,
				dir = 1,
				char = "char",
				posY = -400,
				posX = 0,
				uiset = {
					{
						lineMode = 2,
						path = "OverlayCamera/Overlay/UIMain/TimeSelectWindow/panel",
						pathIndex = -1
					}
				}
			}
		}
	}
}
