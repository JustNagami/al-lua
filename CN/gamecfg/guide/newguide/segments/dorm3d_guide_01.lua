return {
	id = "DORM3D_GUIDE_01",
	events = {
		{
			alpha = 0,
			stories = {
				"SUSHEHUANXINJIHUA1"
			}
		},
		{
			alpha = 0.4,
			style = {
				text = "点击生活区",
				mode = 4,
				dir = 1,
				char = "char",
				posY = -383,
				posX = -72,
				uiset = {}
			},
			ui = {
				pathIndex = -1,
				dynamicPath = function()
					if getProxy(SettingsProxy):IsMellowStyle() then
						return "/OverlayCamera/Overlay/UIMain/NewMainMellowTheme(Clone)/frame/bottom/frame/live"
					else
						return "/OverlayCamera/Overlay/UIMain/NewMainClassicTheme(Clone)/frame/bottom/liveButton"
					end
				end
			}
		},
		{
			alpha = 0.4,
			style = {
				text = "点击宿舍计划",
				mode = 4,
				dir = 1,
				char = "char",
				posY = -326,
				posX = 338,
				uiset = {}
			},
			ui = {
				path = "OverlayCamera/Overlay/UIMain/MainLiveAreaUI(Clone)/dorm_btn",
				pathIndex = -1
			}
		},
		{
			delay = 1.5,
			alpha = 0.4,
			style = {
				text = "点击宿舍",
				mode = 4,
				dir = 1,
				char = "char",
				posY = -136,
				posX = 238,
				uiset = {}
			},
			ui = {
				path = "UICamera/Canvas/UIMain/SelectDorm3DUI(Clone)/Map/floor_1/Tianlangxing",
				pathIndex = -1
			}
		},
		{
			delay = 0.5,
			alpha = 0.4,
			style = {
				text = "下载所需资源后即可进入对应角色宿舍",
				mode = 4,
				dir = 1,
				char = "char",
				posY = -135,
				posX = 0,
				uiset = {
					{
						lineMode = 1,
						path = "UICamera/Canvas/UIMain/SelectDorm3DUI(Clone)/Map/tip/window",
						pathIndex = -1
					}
				}
			}
		}
	}
}
