return {
	id = "NG0045",
	events = {
		{
			alpha = 0.4,
			delay = 0.5,
			style = {
				text = "点击可以切换该关卡的简单模式与困难模式",
				mode = 1,
				dir = -1,
				char = "char",
				posY = -98.3,
				posX = -435.3,
				uiset = {}
			},
			ui = {
				path = "OverlayCamera/Overlay/UIMain/LevelInfoSPUI(Clone)/panel/Difficulty/Normal",
				pathIndex = -1,
				fingerPos = {
					posY = -20,
					posX = 120
				},
				onClick = function()
					return
				end
			}
		}
	}
}
