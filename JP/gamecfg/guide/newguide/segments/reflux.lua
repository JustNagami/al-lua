return {
	id = "Reflux",
	events = {
		{
			is3dDorm = false,
			delay = 0.6,
			alpha = 0.4,
			style = {
				text = "バナーをタップし気になるコンテンツをチェック！",
				mode = 2,
				dir = -1,
				char = "char",
				posY = -104.49,
				posX = -295.6,
				uiset = {
					{
						pathIndex = -1,
						lineMode = 1,
						dynamicPath = function()
							if getProxy(SettingsProxy):IsMellowStyle() then
								return "OverlayCamera/Overlay/UIMain/NewMainMellowTheme(Clone)/frame/left/banner"
							else
								return "OverlayCamera/Overlay/UIMain/NewMainClassicTheme(Clone)/frame/eventPanel/mask"
							end
						end
					}
				}
			}
		},
		{
			is3dDorm = false,
			alpha = 0.4,
			style = {
				text = "ここで開催中のイベントを確認できるわ！",
				mode = 2,
				dir = 1,
				char = "char",
				posY = 152.3,
				posX = 666.6,
				uiset = {
					{
						pathIndex = -1,
						lineMode = 1,
						dynamicPath = function()
							if getProxy(SettingsProxy):IsMellowStyle() then
								return "OverlayCamera/Overlay/UIMain/NewMainMellowTheme(Clone)/frame/right/activity/MainActSummaryBtn"
							else
								return "OverlayCamera/Overlay/UIMain/NewMainClassicTheme(Clone)/frame/linkBtns/MainActSummaryBtn"
							end
						end
					}
				}
			}
		},
		{
			is3dDorm = false,
			alpha = 0.4,
			style = {
				text = "艦隊を出撃させ、報酬を手に入れましょう！",
				mode = 2,
				dir = 1,
				char = "char",
				posY = 0,
				posX = 0,
				uiset = {
					{
						pathIndex = -1,
						lineMode = 1,
						dynamicPath = function()
							if getProxy(SettingsProxy):IsMellowStyle() then
								return "OverlayCamera/Overlay/UIMain/NewMainMellowTheme(Clone)/frame/right/1/battle"
							else
								return "OverlayCamera/Overlay/UIMain/NewMainClassicTheme(Clone)/frame/right/combatBtn"
							end
						end
					}
				}
			}
		}
	}
}
