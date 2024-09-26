return {
	id = "DORM3D_GUIDE_04",
	events = {
		{
			alpha = 0.4,
			style = {
				text = "点击此处可进行区域切换选择",
				mode = 4,
				dir = 1,
				char = "char",
				posY = -439,
				posX = 416,
				uiset = {}
			},
			ui = {
				path = "UICamera/Canvas/UIMain/Dorm3dMainUI(Clone)/UI/base/right/Zone",
				pathIndex = -1
			}
		},
		{
			alpha = 0.4,
			delay = 0.5,
			style = {
				text = "选择餐厅，即可将天狼星呼唤至该区域",
				mode = 4,
				dir = 1,
				char = "char",
				posY = -285,
				posX = 307,
				uiset = {
					{
						lineMode = 2,
						path = "UICamera/Canvas/UIMain/Dorm3dMainUI(Clone)/UI/base/right/Zone/List/Table",
						pathIndex = -1
					}
				}
			},
			ui = {
				lineMode = 2,
				path = "UICamera/Canvas/UIMain/Dorm3dMainUI(Clone)/UI/base/right/Zone/List",
				pathIndex = 1
			}
		}
	}
}
